import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/button.dart';
import '../../../../../core/ui/custom_logo.dart';
import '../../../widget/header.dart';
import '../cubit/otp_cubit.dart';
import '../cubit/otp_state.dart';

class OtpView extends StatefulWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  static const int lengthOtp = 6;
  final List<TextEditingController> _otpController = List.generate(
    lengthOtp,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNode = List.generate(
    lengthOtp,
    (index) => FocusNode(),
  );
  bool _sentOnce = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpFocusNode[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var element in _otpController) {
      element.clear();
      element.dispose();
    }
    for (var element in _otpFocusNode) {
      element.dispose();
    }
    super.dispose();
  }

  //* for give all value as 000000
  String getEnteredOtp() {
    return _otpController.map((c) => c.text).join();
  }

  void _onChanged(String value, int index) {
    if (value.isEmpty) {
      // if user cleared, stay or move back
      if (index > 0) _otpFocusNode[index - 1].requestFocus();
      return;
    }

    // Keep only the last entered char (prevent long paste)
    if (value.length > 1) {
      final lastChar = value.substring(value.length - 1);
      _otpController[index].text = lastChar;
      _otpController[index].selection = TextSelection.collapsed(offset: 1);
    }

    // Move focus to next
    if (index + 1 != lengthOtp) {
      _otpFocusNode[index + 1].requestFocus();
    } else {
      _otpFocusNode[index].unfocus();
    }

    setState(() {}); // to update UI if needed (like enabling verify)
  }

  void _resendOtp(String email) {
    context.read<OtpCubit>().resend(email);
    for (final c in _otpController) c.clear();
    _otpFocusNode[0].requestFocus();
    setState(() {});
  }

  //widget of otp
  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        controller: _otpController[index],
        focusNode: _otpFocusNode[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1E88E5), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          // subtle shadow/container visual:
          // We'll wrap with Material to get shadow under box
        ),
        onChanged: (value) => _onChanged(value, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.email;
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSent) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('OTP sent')));
        } else if (state is OtpVerified) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('OTP verified')));
          // TODO: Navigate to next screen "Home"
        } else if (state is OtpError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is OtpLoading;
        if (!_sentOnce && email.isNotEmpty) {
          _sentOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<OtpCubit>().send(email);
          });
        }
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomLogo(),
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),
                    child: Column(
                      spacing: 20,
                      children: [
                        Header(
                          title: "Whatsapp OTP Verification",
                          subtitle:
                              "Please ensure that the email id mentioned is valid as we have sent an OTP to your email.",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(lengthOtp, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              child: _buildOtpBox(index),
                            );
                          }),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          email,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(height: 36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn't receive OTP code? "),
                            GestureDetector(
                              onTap: isLoading ? null : () => _resendOtp(email),
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                  color:
                                      isLoading
                                          ? Colors.grey
                                          : const Color(0xFF1E88E5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    if (isLoading) return; // prevent double taps
                    final otp = getEnteredOtp();
                    context.read<OtpCubit>().verify(email, otp);
                  },
                  text: isLoading ? 'Please wait...' : 'Verify',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
