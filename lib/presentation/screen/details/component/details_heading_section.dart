
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class DetailScreenHeadingSection extends StatelessWidget {
  const DetailScreenHeadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: purpleLightColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: CustomText(text: 'E-commerce', color: purpleColor),
            ),
            Utils.horizontalSpace(8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: greenLightColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                children: [
                  CustomImage(
                    path: KImages.resolveIcon,
                    width: 14.w,
                    height: 14.h,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(4),
                  CustomText(text: 'Resolved', color: greenColor),
                ],
              ),
            ),
          ],
        ),
        Utils.verticalSpace(10),
        CustomText(
          text: 'Hotel Overcharging for Additional Fees at Resort',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        Utils.verticalSpace(10),
        Row(
          children: [
            CustomText(text: 'by', color: hintTextColor),
            Utils.horizontalSpace(4),
            CustomText(text: 'Jonson Roy'),
            Utils.horizontalSpace(4),
            CustomImage(path: KImages.verifyIcon),
            Utils.horizontalSpace(8),
            Container(
              height: 20.h,
              width: 1,
              decoration: BoxDecoration(color: inputFillBorderColor),
            ),
            Utils.horizontalSpace(8),
            CustomImage(path: KImages.timeIcon, color: textColor),
            Utils.horizontalSpace(8),
            CustomText(text: 'April 14, 2025, 8:45 am'),
          ],
        ),
        Utils.verticalSpace(10),
        Divider(color: inputFillBorderColor),
      ],
    );
  }
}

