import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English (US)';
  final List<Map<String, String>> languages = [
    {"flag": "🇺🇸", "name": "English (US)"},
    {"flag": "🇧🇩", "name": "Bangladesh"},
    {"flag": "🇵🇰", "name": "Pakistan"},
    {"flag": "🇦🇫", "name": "Afghanistan"},
    {"flag": "🇮🇳", "name": "Hindi"},
    {"flag": "🇬🇧", "name": "English (ENG)"},
    {"flag": "🇮🇩", "name": "Indonesian"},
    {"flag": "🇷🇺", "name": "Russia"},
    {"flag": "🇫🇷", "name": "French"},
    {"flag": "🇨🇳", "name": "Chinese"},
    {"flag": "🇯🇵", "name": "Japanese"},
    {"flag": "🇩🇪", "name": "Germany"},
    {"flag": "🇳🇱", "name": "Netherland"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Language'),
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Search message',
              prefixIcon: Padding(
                padding: EdgeInsets.all(10),
                child: CustomImage(
                  path: KImages.searchIcon,
                  color: hintTextColor,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          Utils.verticalSpace(20),
          ListView.builder(
            itemCount: languages.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final lang = languages[index];
              return ListTile(
                leading: Text(
                  lang["flag"]!,
                  style: const TextStyle(fontSize: 22),
                ),
                title: CustomText(
                  text: lang["name"]!,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                trailing:
                    selectedLanguage == lang["name"]!
                        ? const Icon(Icons.check_circle, color: primaryColor)
                        : const Icon(Icons.circle_outlined, color: Colors.grey),
                onTap: () {
                  setState(() {
                    selectedLanguage = lang["name"]!;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
