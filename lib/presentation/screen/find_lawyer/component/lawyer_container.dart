import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class LawyerContainer extends StatelessWidget {
  const LawyerContainer({
    super.key,
    required this.horizontalMargin,
  });

  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.lawyerDetailsScreen);
      },
      child: Container(
        width: 330.w,
        padding: Utils.symmetric(v: 6.0, h: 8.0),
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Lawyer Image
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: CustomImage(
                path: KImages.lawyerImage,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Utils.horizontalSpace(12),

            /// Lawyer Info
            Expanded(
              child: SizedBox(
                height: 120.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Category + Rating
                      Row(
                        children: [
                          Container(
                            padding: Utils.symmetric(h: 6.0, v: 1.0),
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
                              CustomText(
                                text: '4.8',
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: '(2.5K)',
                                color: hintTextColor,
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// Name + Verify
                      Row(
                        children: [
                          Expanded(
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

                      /// Specialization
                      CustomText(text: 'Consumer Rights'),

                      /// Divider
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: hintTextColor.withOpacity(0.2),
                      ),

                      /// Location
                      Row(
                        children: [
                          CustomImage(path: KImages.locationIcon),
                          Utils.horizontalSpace(4),
                          Expanded(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
