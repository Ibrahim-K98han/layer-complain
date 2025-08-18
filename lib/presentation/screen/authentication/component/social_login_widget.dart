import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: inputFillBorderColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            CustomImage(path: icon),
            Utils.horizontalSpace(6),
            CustomText(text: text),
          ],
        ),
      ),
    );
  }
}
