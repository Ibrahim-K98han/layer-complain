import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/circle_image.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class FindLawyerAppBar extends StatefulWidget {
  const FindLawyerAppBar({super.key});

  @override
  State<FindLawyerAppBar> createState() => _FindLawyerAppBarState();
}

class _FindLawyerAppBarState extends State<FindLawyerAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(120.0),
      backgroundColor: secondaryColor,
      pinned: true,
      flexibleSpace: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: Utils.only(top: 60.0, left: 20.0, right: 20.0),
            title: Column(
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  text: 'Find Trusted, Right Lawyer\n for Your Case',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: searchButtonColor,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -44.0,
            left: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: Utils.vSize(50.0),
                width: Utils.mediaQuery(context).width,
                margin: Utils.symmetric(v: 16.0, h: 0.0),
                padding: Utils.only(
                  left: 20.0,
                  right: 6.0,
                  top: 6.0,
                  bottom: 6.0,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff0000000).withOpacity(0.12),
                      blurRadius: 40.0,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImage(
                          path: KImages.searchIcon,
                          color: hintTextColor,
                          width: 20.w,
                          height: 20.h,
                        ),
                        Utils.horizontalSpace(8),
                        CustomText(
                          text: 'Search by Company, Product...',
                          color: hintTextColor,
                        ),
                      ],
                    ),
                    Container(
                      padding: Utils.symmetric(h: 12.0, v: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          CustomText(text: 'Search', color: whiteColor),
                          Utils.horizontalSpace(4.0),
                          CustomImage(path: KImages.searchIcon),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
