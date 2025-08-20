import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/circle_image.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(130.0),
      backgroundColor: secondaryColor,
      pinned: true,
      flexibleSpace: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          FlexibleSpaceBar(
            titlePadding: Utils.only(top: 55.0, left: 20.0, right: 20.0),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleImage(image: KImages.person, size: 44.0),
                        ),
                        Utils.horizontalSpace(8.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              maxLine: 2,
                              text: "Good Morning!",
                              fontSize: 12.0,
                              color: textColor,
                            ),
                            Utils.verticalSpace(2.0),
                            const CustomText(
                              text: 'Cody Lee',
                              fontSize: 16.0,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor),
                            ),
                            child: const CustomImage(
                              path: KImages.notificationSettingsIcon,
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: -4,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Padding(
                                padding: Utils.all(value: 8.0),
                                child: Padding(
                                  padding: Utils.all(value: 0.0),
                                  child: const CustomImage(
                                    path: KImages.notificationSettingsIcon,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -34.0,
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
                        Utils.horizontalSpace(6),
                        CustomText(
                          text: 'Search by Company, Product...',
                          color: hintTextColor,
                        ),
                      ],
                    ),
                    Container(
                      padding: Utils.symmetric(h: 8.0, v: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: searchButtonColor,
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            text: 'Search',
                            color: whiteColor,
                            fontSize: 12,
                          ),
                          Utils.horizontalSpace(2.0),
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
