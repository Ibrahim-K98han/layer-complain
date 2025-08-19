import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class AllLawyer extends StatelessWidget {
  const AllLawyer({super.key, this.title});

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title ?? SizedBox.shrink(),

        ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return AllLawyerContainer();
          },
        ),
        Utils.verticalSpace(8),
      ],
    );
  }
}

class AllLawyerContainer extends StatelessWidget {
  const AllLawyerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.lawyerDetailsScreen);
        },
        child: Container(
          height: 140.h,
          width: 335.w,
          padding: Utils.symmetric(h: 8.0),
          margin: EdgeInsets.symmetric(vertical: 12),
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
                            CustomText(
                              text: '4.8',
                              fontWeight: FontWeight.w600,
                            ),
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
        ),
      ),
    );
  }
}
