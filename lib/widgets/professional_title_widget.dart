import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constraints.dart';
import '../utils/k_images.dart';
import '../utils/utils.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class ProfessionalTitle extends StatelessWidget {
  const ProfessionalTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 8.0, v: 4.0),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: 'Consumer Rights'),
          Utils.horizontalSpace(4),
          CustomImage(
            path: KImages.closeBlackIcon,
            width: 10.w,
            height: 10.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}