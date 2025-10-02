import 'package:flutter/material.dart';
import '../../../../core/router/string_router.dart';
import '../../../../core/style/font_style_app.dart';
import '../../../../core/ui/button.dart';
import '../widget/custom_card_select_language.dart';
import '../../domain/languages_data.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String? selectedLanguage = LanguageData.languages.first.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose Your Language",
                style: FontStyleApp.mediumLargeStyle,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    itemCount: LanguageData.languages.length,
                    itemBuilder: (context, index) {
                      return CustomCardSelectLanguage(
                        index: index,
                        selectedLanguage: selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  //navigation to register screen
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    StringRouter.signUp,
                    (route) => false,
                  );
                },
                text: 'Select',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
