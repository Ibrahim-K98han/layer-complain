import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/get_pro_upgrade_widget.dart';
import 'component/profile_header.dart';
import 'component/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFF5F6),
        title: CustomText(
          text: 'Profile',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.settingsScreen);
              },
              child: CustomImage(path: KImages.settingIcon),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF5F6), Color(0xFFFDFCFC)],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: Utils.symmetric(),
            child: Column(
              children: [
                ///============== Profile Header Section ==============///
                ProfileHeader(),
                Utils.verticalSpace(16),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.findLawyerScreen);
                  },
                  image: KImages.findLawyerIcon,
                  title: 'Find Lawyer',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.myComplaintsScreen);
                  },
                  image: KImages.myComplaintIcon,
                  title: 'My Complaint',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.reviewScreenScreen);
                  },
                  image: KImages.reviewIcon,
                  title: 'Review',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.messageDubleIcon,
                  title: 'Message',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.supportTicketScreen,
                    );
                  },
                  image: KImages.supportTicketIcon,
                  title: 'Support Ticket',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.privacyPolicyScreen,
                    );
                  },
                  image: KImages.privacyPolicyIcon,
                  title: 'Privacy Policy',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.termsConditionScreen,
                    );
                  },
                  image: KImages.termsConditionIcon,
                  title: 'Terms & Condition',
                ),
                ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.appInfoScreen);
                  },
                  image: KImages.appInfoIcon,
                  title: 'App Info',
                ),
                ProfileItem(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: textColor.withOpacity(0.5),
                      builder: (context) {
                        return ShowAddLogoutDialog();
                      },
                    );
                  },
                  image: KImages.logoutIcon,
                  title: 'Logout',
                ),
                Utils.verticalSpace(8),

                /// ================ Get Upgrade Now ============///
                GetProUpgradeWidget(),
                Utils.verticalSpace(120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowAddLogoutDialog extends StatelessWidget {
  const ShowAddLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImage(
            path: KImages.logout,
            width: 120.w,
            height: 120,
            fit: BoxFit.cover,
          ),
          Utils.verticalSpace(16),
          CustomText(
            textAlign: TextAlign.center,
            text: 'Are you Sure?\nLogout your Account',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: Utils.symmetric(h: 16.0, v: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: inputFillBorderColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: CustomText(text: 'Cancel', fontSize: 16),
                    ),
                  ),
                ),
              ),
              Utils.horizontalSpace(8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.loginScreen);
                  },
                  child: Container(
                    padding: Utils.symmetric(h: 16.0, v: 12.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Logout',
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
