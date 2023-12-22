import 'package:flutter/material.dart';

import '../../widgets/Laguage_widgets/language_item.dart';
import '../../widgets/reusable_text.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ReusableBigText(message: "Language"),
        centerTitle: true,
      ),
      body: ListView(children: const [
        Column(
          children: [
            LanguageItem(name: 'portugal'),
            Divider(thickness: 1),
            LanguageItem(name: 'england'),
            Divider(thickness: 1),
            LanguageItem(name: 'korea'),
            Divider(thickness: 1),
            LanguageItem(name: 'netherlands'),
            Divider(thickness: 1),
            LanguageItem(name: 'france'),
            Divider(thickness: 1),
            LanguageItem(name: 'japan'),
            Divider(thickness: 1),
            LanguageItem(name: "arabic"),
            Divider(thickness: 1),
            LanguageItem(name: "germany"),
            Divider(thickness: 1),
          ],
        ),
      ]),
    );
  }
}
