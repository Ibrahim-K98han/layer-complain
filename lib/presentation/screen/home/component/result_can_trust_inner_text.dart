import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class ResultCanTrustInnerText extends StatelessWidget {
  const ResultCanTrustInnerText({
    super.key,
    this.iconWidget,
    this.title,
    this.subTitle,
    this.widget,
  });

  final Widget? iconWidget;
  final String? title;
  final String? subTitle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                iconWidget ?? SizedBox.shrink(),
                Utils.horizontalSpace(2),
                CustomText(
                  text: title ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ],
            ),
            CustomText(text: subTitle ?? '', fontSize: 11, color: whiteColor),
          ],
        ),
        widget ?? SizedBox.shrink(),
      ],
    );
  }
}