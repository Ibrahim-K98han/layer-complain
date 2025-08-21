import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import '../../../../utils/k_images.dart';
import 'main_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final MainController controller;

  const MyBottomNavigationBar({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: controller.naveListener.stream,
      builder: (context, snapshot) {
        final selectedIndex = snapshot.data ?? 0;
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          color: whiteColor,
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          child: Container(
            color: whiteColor,
            width: 100.w,
            height: Platform.isAndroid ? 110 : 110,
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side Icons
                Row(
                  children: [
                    _navButton(
                      KImages.homeIcon,
                      KImages.homeActiveIcon,
                      'Home',
                      0,
                      selectedIndex,
                    ),
                    const SizedBox(width: 35),
                    _navButton(
                      KImages.complainsIcon,
                      KImages.complainsActiveIcon,
                      'Complains',
                      1,
                      selectedIndex,
                    ),
                  ],
                ),
                // Right Side Icons
                Row(
                  children: [
                    _navButton(
                      KImages.messageIcon,
                      KImages.messageActiveIcon,
                      'Message',
                      3,
                      selectedIndex,
                    ),
                    const SizedBox(width: 35),
                    _navButton(
                      KImages.profileIcon,
                      KImages.profileActiveIcon,
                      'Profile',
                      4,
                      selectedIndex,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _navButton(
    String icon,
    String activeIcon,
    String text,
    int index,
    int selectedIndex,
  ) {
    return GestureDetector(
      onTap: () => controller.changeNav(index),
      child: Column(
        children: [
          SvgPicture.asset(
            selectedIndex == index ? activeIcon : icon,
            height: 22.h,
            width: 22.w,
          ),
          Utils.verticalSpace(2.0),
          CustomText(
            text: text,
            fontSize: 12,
            color: selectedIndex == index ? primaryColor : hintTextColor,
          ),
        ],
      ),
    );
  }
}
