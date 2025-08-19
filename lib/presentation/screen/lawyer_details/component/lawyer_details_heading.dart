import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import 'lawyer_consumer_item.dart';

class LawyerDetailsHeading extends StatelessWidget {
  const LawyerDetailsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: CustomImage(
            path: KImages.lawyerImage,
            width: 110.w,
            height: 120.h,
            fit: BoxFit.cover,
          ),
        ),
        Utils.horizontalSpace(6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(text: 'Consumer Rights Lawyer', color: primaryColor),
            Utils.verticalSpace(8),
            LawyerConsumerItem(
              image: KImages.experienceIcon,
              title: 'Experience: ',
              subTitle: '6+ years',
            ),
            LawyerConsumerItem(
              image: KImages.timeIcon,
              title: 'Availability: ',
              subTitle: 'Mon–Sat, 10AM – 7PM',
            ),
            LawyerConsumerItem(
              image: KImages.starIcon,
              title: 'Total Rating: ',
              subTitle: '4.9/5(4.1K)',
            ),
            LawyerConsumerItem(
              image: KImages.winCaseIcon,
              title: 'Win Case: ',
              subTitle: '3587',
            ),
          ],
        ),
      ],
    );
  }
}
