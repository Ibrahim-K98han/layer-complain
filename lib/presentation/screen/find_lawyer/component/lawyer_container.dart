import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class LawyerContainer extends StatelessWidget {
  const LawyerContainer({super.key, required this.horizontalMargin,});
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.lawyerDetailsScreen);
      },
      child: Container(
        width: 330.w,
        padding: Utils.symmetric(v: 4.0, h: 8.0),
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: CustomImage(
                path: KImages.lawyerImage,
                width: 124.w,
                height: 124.h,
                fit: BoxFit.cover,
              ),
            ),
            Utils.horizontalSpace(12),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: Utils.symmetric(h: 4.0, v: 2.0),
                        decoration: BoxDecoration(
                          color: primaryLightColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: CustomText(
                          text: 'Consumer',
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Utils.horizontalSpace(4),
                      Row(
                        children: [
                          CustomImage(
                            path: KImages.starFileIcon,
                            width: 14.w,
                            height: 14.h,
                            fit: BoxFit.cover,
                          ),
                          Utils.horizontalSpace(4),
                          CustomText(text: '4.8', fontWeight: FontWeight.w600),
                          CustomText(text: '(2.5K)', color: hintTextColor),
                        ],
                      ),
                    ],
                  ),
                  Utils.verticalSpace(10),
                  Row(
                    children: [
                      SizedBox(
                        width: 125.w,
                        child: CustomText(
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                          text: 'John Smith, Esq',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Utils.horizontalSpace(2),
                      CustomImage(
                        path: KImages.verifyIcon,
                        width: 14.w,
                        height: 14.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  CustomText(text: 'Consumer Rights'),
                  Utils.verticalSpace(8),
                  Container(
                    width: 160.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: hintTextColor.withOpacity(0.2),
                    ),
                  ),
                  Utils.verticalSpace(8),
                  Row(
                    children: [
                      CustomImage(path: KImages.locationIcon),
                      Utils.horizontalSpace(4),
                      SizedBox(
                        width: 140,
                        child: CustomText(
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                          text: '2464 Royal  Jersey 45',
                          color: lightTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
