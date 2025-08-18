import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/home/component/result_can_trust_inner_text.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ResultCanTrustSection extends StatelessWidget {
  const ResultCanTrustSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Results you Can Trust',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                  ),
                  Utils.verticalSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ResultCanTrustInnerText(
                        title: '2M+',
                        subTitle: 'Verified Users',
                        iconWidget: CustomImage(
                          path: KImages.fireIcon,
                          width: 16.w,
                          height: 16,
                          fit: BoxFit.cover,
                        ),
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 30,
                            width: 1,
                            color: whiteColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      ResultCanTrustInnerText(
                        title: '50+',
                        subTitle: 'Countries',
                      ),
                      ResultCanTrustInnerText(
                        title: '40K+',
                        subTitle: 'Resolved',
                      ),
                      ResultCanTrustInnerText(
                        title: '88%',
                        subTitle: 'Satisfied',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Filed Complaint',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomImage(
                      path: KImages.arrowRightIcon,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
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
