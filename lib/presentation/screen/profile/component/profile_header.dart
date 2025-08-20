import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/profile/component/profile_header_complain_count.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Utils.verticalSpace(16),
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CustomImage(
            path: KImages.person,
            width: 60.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
        ),
        Utils.verticalSpace(8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: 'Cody Lee',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            Utils.horizontalSpace(8),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.profileSettingsScreen);
               },
              child: CustomImage(path: KImages.editIcon),
            ),
          ],
        ),
        CustomText(
          text: 'codylee@gmail.com',
          fontSize: 16,
          color: lightTextColor,
        ),
        Utils.verticalSpace(16),
        Container(
          padding: Utils.symmetric(h: 8.0, v: 8.0),
          width: double.infinity,
          height: 90.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            color: whiteColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileHeaderComplainCount(
                image: KImages.activeComplaintsIcon,
                title: '500',
                subTitle: 'Active Complaints',
                widget: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Container(
                    width: 0.5,
                    height: 30,
                    color: lightTextColor,
                  ),
                ),
              ),
              ProfileHeaderComplainCount(
                image: KImages.solveComplaintsIcon,
                title: '2300',
                subTitle: 'Solve Complaints',
                widget: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Container(
                    width: 0.5,
                    height: 30,
                    color: lightTextColor,
                  ),
                ),
              ),
              ProfileHeaderComplainCount(
                image: KImages.activeComplaintsIcon,
                title: '2700',
                subTitle: 'Total Complaints',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
