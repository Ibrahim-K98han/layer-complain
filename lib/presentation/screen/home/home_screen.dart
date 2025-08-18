import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/home/component/home_app_bar.dart';
import 'package:layer_complain/presentation/screen/home/component/home_banner_section.dart';
import 'package:layer_complain/presentation/screen/home/component/recent_complaints_section.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/result_can_trust_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: inputFillColor,
      body: CustomScrollView(
        slivers: [
          ///============== Home Screen App Bar ===========///
          HomeAppBar(),

          ///============= Result you Can Trust Section ==========///
          ResultCanTrustSection(),

          ///============= Recent Complaints Section ===========///
          RecentComplaintsSection(
            containerWidth: 248,
            title: 'Recent Complaints',
            widget: CustomText(
              text: 'View All',
              color: hintTextColor,
              fontSize: 12,
            ),
            direction: Axis.horizontal,
            scrollHeight: 150.h,
          ),

          /// ============ Banner Section ================///
          HomeBannerSection(),

          ///============ All Complaints Section =============///
          SliverToBoxAdapter(child: Utils.verticalSpace(20)),
          RecentComplaintsSection(
            containerWidth: 335,
            title: 'All Complaints',
            direction: Axis.vertical,
            verticalMargin: 10.0,
            horizontalMargin: 0.0,
            scrollHeight: 400.h,
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(100)),
        ],
      ),
    );
  }
}
