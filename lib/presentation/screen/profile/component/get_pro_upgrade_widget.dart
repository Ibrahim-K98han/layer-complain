import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class GetProUpgradeWidget extends StatelessWidget {
  const GetProUpgradeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 14.0, v: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: Utils.all(value: 8.r),
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
                child: CustomImage(
                  path: KImages.proProfileIcon,
                  width: 35.w,
                  height: 35.h,
                  fit: BoxFit.cover,
                ),
              ),
              Utils.horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Get Pro Upgrade Now',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: '30-Day Money-Back Guarantee',
                    fontSize: 11,
                    color: lightTextColor,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.subscriptionScreen);
            },
            child: Container(
              padding: Utils.symmetric(h: 12.0, v: 4.0),
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: CustomImage(path: KImages.arrowRightIcon),
            ),
          ),
        ],
      ),
    );
  }
}
