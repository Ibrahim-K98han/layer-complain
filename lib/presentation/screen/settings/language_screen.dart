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
  bool isSelected = false;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImage(
                    path: KImages.usIcon,
                    width: 20,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(10),
                  CustomText(
                    text: 'English (US)',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Container(
                padding: Utils.all(value: 6),
                decoration: BoxDecoration(
                  color: primaryColor,

                  shape: BoxShape.circle,
                ),
                child: CustomImage(path: KImages.rightIcon),
              ),
            ],
          ),
          Utils.verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImage(
                    path: KImages.usIcon,
                    width: 20,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(10),
                  CustomText(
                    text: 'English (US)',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Container(
                padding: Utils.all(value: 6),
                decoration: BoxDecoration(
                  color: primaryColor,

                  shape: BoxShape.circle,
                ),
                child: CustomImage(path: KImages.rightIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
