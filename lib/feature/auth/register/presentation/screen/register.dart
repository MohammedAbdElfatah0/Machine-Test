import 'package:calley/core/ui/button.dart';
import 'package:calley/core/style/color_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/router/string_router.dart';
import '../../../../../core/style/font_style_app.dart';
import '../../../../../core/ui/custom_logo.dart';
import '../../../widget/custem_text_form_field.dart';
import '../../../widget/header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //all controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  //foucs node
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isAgree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                CustomLogo(),
                const SizedBox(height: 75),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: ColorManager.divider,
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 20,
                        children: [
                          Header(
                            title: "Welcome!",
                            subtitle: "Please register to continue",
                          ),
                          SizedBox(height: 2),
                          CustomTextFormField(
                            icon: const Icon(Icons.person_3_outlined),
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            hint: "Enter your name",
                            onFieldSubmitted: (p0) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_emailFocusNode);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            isPassword: false,
                          ),
                          CustomTextFormField(
                            icon: const Icon(Icons.email_outlined),
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            hint: 'Email Address',
                            onFieldSubmitted: (p0) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            isPassword: false,
                          ),
                          CustomTextFormField(
                            icon: const Icon(Icons.lock_outline),
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            hint: 'Password',
                            onFieldSubmitted: (p0) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_phoneFocusNode);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          CustomTextFormField(
                            prefixIcon: true,
                            icon: const Icon(Icons.phone_android_outlined),
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            hint: 'Phone Number',
                            onFieldSubmitted: (p0) {
                              FocusScope.of(context).unfocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            isPassword: false,
                          ),

                          Row(
                            children: [
                              Checkbox(
                                checkColor: ColorManager.checkboxCheck,
                                activeColor: ColorManager.checkboxActive,
                                value: _isAgree,
                                onChanged: (value) {
                                  setState(() {
                                    _isAgree = value!;
                                  });
                                },
                              ),
                              Text(
                                'I agree to the Terms and Conditions',
                                style: FontStyleApp.smallStyle,
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: FontStyleApp.smallStyle.copyWith(
                                        color: ColorManager.textPrimary,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Sign In',
                                      style: FontStyleApp.smallStyle.copyWith(
                                        color: ColorManager.link,
                                      ),
                                      recognizer:
                                          TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                context,
                                                StringRouter.signIn,
                                              );
                                            },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    //navigation to confrim email screen
                  },
                  text: 'Sign Up',
                ),
                //button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
