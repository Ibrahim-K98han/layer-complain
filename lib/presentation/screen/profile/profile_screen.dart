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
        title: CustomText(text: 'Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CustomImage(path: KImages.settingIcon),
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
                  onTap: () {},
                  image: KImages.myComplaintIcon,
                  title: 'My Complaint',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.reviewIcon,
                  title: 'Review',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.messageDubleIcon,
                  title: 'Message',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.supportTicketIcon,
                  title: 'Support Ticket',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.privacyPolicyIcon,
                  title: 'Privacy Policy',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.termsConditionIcon,
                  title: 'Terms & Condition',
                ),
                ProfileItem(
                  onTap: () {},
                  image: KImages.appInfoIcon,
                  title: 'App Info',
                ),
                ProfileItem(
                  onTap: () {},
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
