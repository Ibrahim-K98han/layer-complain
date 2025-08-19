
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class DetailsBannerSection extends StatelessWidget {
  const DetailsBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Utils.verticalSpace(16),
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomImage(
                path: KImages.bannerBg,
                width: double.infinity,
                height: 125.h,
              ),
            ),
            Container(
              width: double.infinity,
              height: 125.h,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            Padding(
              padding: Utils.symmetric(h: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Connect With Trusted\n Legal Eperts Fast',
                        color: whiteColor,
                      ),
                      Utils.verticalSpace(12),
                      Row(
                        children: [
                          CustomText(
                            text: 'Browser a Lawyer',
                            color: whiteColor,
                            fontSize: 11,
                          ),
                          Utils.horizontalSpace(12.0),
                          Container(
                            padding: Utils.symmetric(h: 8.0, v: 4.0),
                            decoration: BoxDecoration(
                              color: yellowColor,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: CustomImage(path: KImages.arrowRightIcon),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      ShaderMask(
                        shaderCallback:
                            (bounds) => LinearGradient(
                          colors: [Colors.black, Colors.white12],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: CustomText(
                          text: 'Lawy ers',
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20),
                        child: CustomImage(
                          path: KImages.modelBanner,
                          width: 128.w,
                          height: 118.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Utils.verticalSpace(16),
      ],
    );
  }
}


