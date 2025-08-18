
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class EvidenceSection extends StatelessWidget {
  const EvidenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.verticalSpace(16),
        CustomText(text: 'Evidence', fontSize: 16, fontWeight: FontWeight.w500),
        Utils.verticalSpace(8),
        Container(
          padding: Utils.symmetric(h: 10.0, v: 10.0),
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomImage(
                      path: KImages.evidence,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Utils.verticalSpace(4),
                  CustomText(text: 'Book Confirmation', fontSize: 11),
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomImage(
                      path: KImages.evidence,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Utils.verticalSpace(4),
                  CustomText(text: 'Book Confirmation', fontSize: 11),
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomImage(
                      path: KImages.evidence,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  Utils.verticalSpace(4),
                  CustomText(text: 'Book Confirmation', fontSize: 11),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
