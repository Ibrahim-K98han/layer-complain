import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.r),
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: isSelected ? textColor : Colors.transparent,
                border: Border.all(color: textColor),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomImage(
                  path: KImages.rightIcon,
                  color: isSelected ? whiteColor : whiteColor,
                ),
              ),
            ),
            Utils.horizontalSpace(4),
            CustomText(text: text, fontSize: 12, color: lightTextColor),
          ],
        ),
      ),
    );
  }
}