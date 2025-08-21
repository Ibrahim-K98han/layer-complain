import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class IdentityPhoneEmail extends StatelessWidget {
  const IdentityPhoneEmail({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.isSelected,
  });

  final String icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Utils.symmetric(v: 16.0, h: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: inputFillBorderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: Utils.symmetric(v: 10.0),
                  decoration: BoxDecoration(
                    color: primaryLightColor,
                    shape: BoxShape.circle,
                  ),
                  child: CustomImage(path: icon),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: title, fontWeight: FontWeight.w600),
                      Utils.verticalSpace(4),
                      CustomText(
                        text: subTitle,
                        fontSize: 12,
                        color: lightTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isSelected) CustomImage(path: KImages.rightMarkIcon),
          ],
        ),
      ),
    );
  }
}
