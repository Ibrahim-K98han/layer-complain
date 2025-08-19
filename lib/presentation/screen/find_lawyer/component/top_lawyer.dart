import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class TopLawyer extends StatelessWidget {
  const TopLawyer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Utils.symmetric(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Top Lawyer',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.allLawyerScreen);
                },
                child: CustomText(
                  text: 'View All',
                  fontSize: 12,
                  color: lightTextColor,
                ),
              ),
            ],
          ),
        ),
        Utils.verticalSpace(8),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return TopLawyerContainer();
            },
          ),
        ),
      ],
    );
  }
}

class TopLawyerContainer extends StatelessWidget {
  const TopLawyerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 310.w,
      padding: Utils.symmetric(v: 4.0, h: 4.0),
      margin: EdgeInsets.symmetric(horizontal: 12),
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
                    Utils.horizontalSpace(8),
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
                      width: 150,
                      child: CustomText(
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                        text: 'John Smith, Esq',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Utils.horizontalSpace(4),
                    CustomImage(
                      path: KImages.verifyIcon,
                      width: 14.w,
                      height: 14.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                CustomText(text: 'Consumer Rights'),
                Utils.verticalSpace(12),
                Row(
                  children: [
                    CustomImage(path: KImages.locationIcon),
                    Utils.horizontalSpace(4),
                    SizedBox(
                      width: 150,
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
    );
  }
}
