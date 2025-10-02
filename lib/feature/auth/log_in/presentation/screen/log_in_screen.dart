import 'package:calley/core/ui/custom_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/color_manager.dart';
import '../../../../../core/style/font_style_app.dart';
import '../../../../../core/ui/button.dart';
import '../../../widget/custem_text_form_field.dart';
import '../../../widget/header.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 42),
          child: Column(
            children: [
              CustomLogo(),
              SizedBox(height: 75),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    spacing: 20,
                    children: [
                      Header(
                        title: "Welcome",
                        subtitle: "Please sign-in to continue",
                      ),
                      SizedBox(height: 2),
                      CustomTextFormField(
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
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        hint: 'Password',
                        onFieldSubmitted: (p0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_passwordFocusNode);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        isPassword: true,
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: FontStyleApp.smallStyle.copyWith(
                                    color: ColorManager.textPrimary,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: FontStyleApp.smallStyle.copyWith(
                                    color: ColorManager.link,
                                  ),
                                  recognizer:
                                      TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
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

              CustomButton(onPressed: () {}, text: 'Log In'),
            ],
          ),
        ),
      ),
    );
  }
}
