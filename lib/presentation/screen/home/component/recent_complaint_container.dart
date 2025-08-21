import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class RecentComplaintContainer extends StatelessWidget {
  const RecentComplaintContainer({
    super.key,
    this.containerWidth,
    this.verticalMargin,
    this.horizontalMargin,
  });

  final double? containerWidth;
  final double? verticalMargin;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.complaintsDetailsScreen);
      },
      child: Container(
        // height: 132.h,
        width: containerWidth?.w,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 8.0,
          vertical: verticalMargin ?? 6.0,
        ),
        padding: Utils.symmetric(h: 12.0, v: 14.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Refund Not Processed by Super Store Electronics',
              color: hintTextColor,
              fontSize: 14,
            ),
            Utils.verticalSpace(6),
            Row(
              children: [
                CustomImage(
                  path: KImages.instaIcon,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                ),
                Utils.horizontalSpace(6),
                CustomText(text: 'Alpha IT Com', fontWeight: FontWeight.w600),
              ],
            ),
            Utils.verticalSpace(6),
            Utils.horizontalLine(),
            Utils.verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(text: 'by', color: hintTextColor, fontSize: 12),
                    Utils.horizontalSpace(4),
                    CustomText(text: 'Jonson'),
                    Utils.horizontalSpace(4),
                    CustomImage(
                      path: KImages.verifyIcon,
                      width: 12.w,
                      height: 12.h,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  // 🔹 smaller
                  decoration: BoxDecoration(
                    color: yellowLightColor,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: yellowColor),
                  ),
                  child: Row(
                    children: [
                      CustomImage(
                        path: KImages.pendingIcon,
                        width: 10.w,
                        height: 10.h,
                        fit: BoxFit.cover,
                      ),
                      Utils.horizontalSpace(4),
                      CustomText(
                        text: 'Pending',
                        fontSize: 11,
                        color: yellowColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
