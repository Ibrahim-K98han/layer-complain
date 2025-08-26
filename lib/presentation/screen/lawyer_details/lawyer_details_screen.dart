import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/lawyer_details/component/about_tile.dart';
import 'package:layer_complain/presentation/screen/lawyer_details/component/review_tile.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/experience_and_notable.dart';
import 'component/lawyer_details_heading.dart';
import 'component/lawyer_share_dialog.dart';
import 'component/message_hire_btn_section.dart';
import 'component/specialization_tile.dart';

class LawyerDetailsScreen extends StatefulWidget {
  const LawyerDetailsScreen({super.key});

  @override
  State<LawyerDetailsScreen> createState() => _LawyerDetailsScreenState();
}

class _LawyerDetailsScreenState extends State<LawyerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'John Smith, Esq.',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LawyerShareDialog();
                  },
                );
              },
              child: CustomImage(path: KImages.shareRightIcon),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MessageHireBtnSection(),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            /// ============= Lawyer Heading ==========///
            LawyerDetailsHeading(),
            Utils.verticalSpace(16),

            /// ============== About Tile ============///
            AboutTile(),

            ///=============== Specialization Area Tile ==========///
            SpecializationTile(),

            ///============== Experience And Notable Tile=========///
            ExperienceAndNotable(),

            ///============== Review Tile =============///
            ReviewTile(),
          ],
        ),
      ),
    );
  }
}
