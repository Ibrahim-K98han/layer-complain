import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/component/find_lawyer_app_bar.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/component/lawyer_banner.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/all_lawyer.dart';
import 'component/top_lawyer.dart';

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
          SliverToBoxAdapter(child: Utils.verticalSpace(40)),

          /// =============== Top Lawyer Section ===========///
          SliverToBoxAdapter(child: TopLawyer()),

          ///================ Lawyer Banner Section ===========///
          SliverToBoxAdapter(child: LawyerBanner()),

          /// =============== All Lawyer Section ===========///
          SliverToBoxAdapter(
            child: AllLawyer(
              title: Padding(
                padding: Utils.symmetric(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'All Lawyer',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
