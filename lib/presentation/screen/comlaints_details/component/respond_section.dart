
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class RespondSection extends StatelessWidget {
  const RespondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.verticalSpace(16),
        CustomText(text: 'Respond', fontSize: 16, fontWeight: FontWeight.w500),
        Utils.verticalSpace(8),
        Container(
          padding: Utils.symmetric(h: 12.0, v: 12.0),
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: shareTripContainerBorderColor),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomImage(
                    path: KImages.shareTrip,
                    width: 32.w,
                    height: 32.h,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Share Trip',
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: 'April 14, 2025, 8:45 am',
                          fontSize: 9,
                          color: hintTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CustomText(
                  textAlign: TextAlign.justify,
                  text:
                  'We apologize for the inconvenience. The service fee was a standard charge for amenities, but it communicated clearly at the time of booking. We are a partial refund of ${100} for the overcharge.',
                  fontSize: 12,
                  color: lightTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



