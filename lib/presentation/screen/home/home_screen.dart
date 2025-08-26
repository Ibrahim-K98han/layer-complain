import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/home/component/home_app_bar.dart';
import 'package:layer_complain/presentation/screen/home/component/home_banner_section.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';

import '../../../widgets/heading_text.dart';
import 'component/recent_complaint_container.dart';
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
          SliverToBoxAdapter(
            child: HeadingText(
              title: 'Recent Complaints',
              subTitle: 'View All',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.complainScreen,
                  arguments: {'showBack': true},
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(8)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return RecentComplaintContainer(containerWidth: 248.w);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(8)),

          /// ============ Banner Section ================///
          SliverToBoxAdapter(child: CarouselExample()),

          ///============ All Complaints Section =============///
          SliverToBoxAdapter(child: Utils.verticalSpace(20)),
          SliverToBoxAdapter(
            child: HeadingText(
              title: 'All Complaints',
              subTitle: '',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              padding: Utils.symmetric(h: 10.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return RecentComplaintContainer();
              },
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(100)),
        ],
      ),
    );
  }
}
