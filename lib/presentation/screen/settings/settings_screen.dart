import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/circle_image.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        bgColor: whiteColor,
        titleCenter: true,
        title: 'Settings',
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              gradient: LinearGradient(
                colors: [whiteColor, secondaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                CircleImage(image: KImages.person, size: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Cody Lee",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    Utils.horizontalSpace(6),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.profileSettingsScreen,
                        );
                      },
                      child: CustomImage(path: KImages.editIcon),
                    ),
                  ],
                ),
                CustomText(
                  text: "codylee@gmail.com",
                  fontSize: 16,
                  color: lightTextColor,
                ),
              ],
            ),
          ),

          Utils.verticalSpace(20),
          Expanded(
            child: ListView(
              children: [
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.profileSettingsScreen,
                    );
                  },
                  icon: KImages.profileSettingIcon,
                  title: "Profile Setting",
                ),
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.notificationSettingScreen,
                    );
                  },
                  icon: KImages.notificationSettingsIcon,
                  title: "Notifications Setting",
                ),
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.languageScreen);
                  },
                  icon: KImages.languageIcon,
                  title: "Language",
                ),
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.linkAccountScreen);
                  },
                  icon: KImages.linkAccountIcon,
                  title: "Link Account",
                ),
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.changePasswordScreen,
                    );
                  },
                  icon: KImages.passwordChangeIcon,
                  title: "Password Change",
                ),
                SettingsTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.deleteAccountScreen,
                    );
                  },
                  icon: KImages.immediateRemoveIcon,
                  title: "Delete Account",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: Utils.symmetric(),
      leading: CustomImage(
        path: icon,
        width: 24.w,
        height: 24.h,
        fit: BoxFit.cover,
      ),
      title: CustomText(text: title, fontWeight: FontWeight.w500),
      onTap: onTap,
    );
  }
}
