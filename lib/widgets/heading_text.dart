import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, this.title, this.subTitle, this.onTap});

  final String? title;
  final String? subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title ?? '',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: onTap,
            child: CustomText(
              text: subTitle ?? '',
              fontSize: 12,
              color: lightTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
