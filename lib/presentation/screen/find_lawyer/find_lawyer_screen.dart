import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/component/find_lawyer_app_bar.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/component/lawyer_banner.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/heading_text.dart';

import '../../../routes/route_names.dart';
import 'component/lawyer_container.dart';

class FindLawyerScreen extends StatefulWidget {
  const FindLawyerScreen({super.key});

  @override
  State<FindLawyerScreen> createState() => _FindLawyerScreenState();
}

class _FindLawyerScreenState extends State<FindLawyerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FindLawyerAppBar(),
          SliverToBoxAdapter(child: Utils.verticalSpace(35)),
          /// =============== Top Lawyer Section ===========///
          SliverToBoxAdapter(
            child: HeadingText(
              title: 'Top Lawyer',
              subTitle: 'View All',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.allLawyerScreen);
              },
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(8)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 135,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return LawyerContainer(horizontalMargin: 4.0,);
                },
              ),
            ),
          ),

          ///================ Lawyer Banner Section ===========///
          SliverToBoxAdapter(child: LawyerBanner()),

          /// =============== All Lawyer Section ===========///
          SliverToBoxAdapter(
            child: HeadingText(
              title: 'All Lawyer',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.allLawyerScreen);
              },
            ),
          ),
          SliverToBoxAdapter(child: Utils.verticalSpace(8)),
          SliverToBoxAdapter(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: Utils.only(bottom: 12.0),
                  child: LawyerContainer(horizontalMargin: 12.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
