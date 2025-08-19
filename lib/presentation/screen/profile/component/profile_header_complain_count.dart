import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ProfileHeaderComplainCount extends StatelessWidget {
  const ProfileHeaderComplainCount({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.widget,
  });

  final String image;
  final String title;
  final String subTitle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              path: image,
              width: 18.w,
              height: 18.h,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(4),
            CustomText(text: title, fontWeight: FontWeight.w700),
            CustomText(text: subTitle, fontSize: 11, color: lightTextColor),
          ],
        ),
        widget ?? SizedBox.shrink(),
      ],
    );
  }
}
