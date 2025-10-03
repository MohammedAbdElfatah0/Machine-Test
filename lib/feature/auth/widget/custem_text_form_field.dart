import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:calley/core/style/color_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final String? Function(String?)? validator;
  final bool isPassword;
  final Function(String)? onFieldSubmitted;
  final Widget? icon;
  final bool? prefixIcon;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hint,
    this.validator,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.icon,
    this.prefixIcon = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = true;
  OutlineInputBorder _outLineInPutBorder({bool error = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      gapPadding: 8,
      borderSide: BorderSide(
        color: error ? ColorManager.error : ColorManager.border,
        width: 1.25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? _isObscure : false,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: ColorManager.hint, fontSize: 14),
        border: _outLineInPutBorder(),
        focusedBorder: _outLineInPutBorder(),
        errorBorder: _outLineInPutBorder(error: true),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        prefix:
            widget.prefixIcon == true
                ? SizedBox(
                  width: 100,
                  child: CountryCodePicker(
                    onChanged: (country) {},
                    initialSelection: 'EG',
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    showFlag: true,
                    padding: EdgeInsets.zero,
                    dialogTextStyle: TextStyle(
                      fontSize: 16,
                      color: ColorManager.textPrimary,
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: ColorManager.textPrimary,
                    ),
                  ),
                )
                : null,
        suffixIcon:
            widget.isPassword
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.lock_outline : Icons.lock_open,
                      ),
                    ),
                  ],
                )
                : widget.icon,
      ),
    );
  }
}
