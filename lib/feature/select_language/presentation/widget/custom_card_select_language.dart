import 'package:flutter/material.dart';

import '../../domain/languages_data.dart';

class CustomCardSelectLanguage extends StatelessWidget {
  const CustomCardSelectLanguage({
    super.key,
    required this.index,
    this.selectedLanguage,
    required this.onChanged,
  });

  final int index;
  final String? selectedLanguage;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final language = LanguageData.languages[index];
    return ListTile(
      trailing: Radio<String>(
        fillColor: WidgetStatePropertyAll(Colors.black),
        activeColor: Colors.black,
        value: language.name,
        groupValue: selectedLanguage ?? LanguageData.languages.first.name,
        onChanged: onChanged,
      ),
      title: Text(language.name),
      subtitle: Text(language.greeting),
    );
  }
}
