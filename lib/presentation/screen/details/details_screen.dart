import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/comment_container.dart';
import 'component/details_banner_section.dart';
import 'component/details_heading_section.dart';
import 'component/evidence_section.dart';
import 'component/report_dialog.dart';
import 'component/respond_section.dart';
import 'component/share_trip_section.dart';
import 'component/social_media_widget.dart';
import 'component/summary_section.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        bgColor: whiteColor,
        title: 'Complaints',
        action: [
          IconButton(
            onPressed: () async {
              final result = await showMenu<String>(
                context: context,
                position: RelativeRect.fromLTRB(200, 100, 0, 0),
                color: whiteColor,
                items: [
                  PopupMenuItem(
                    value: "message",
                    child: Row(
                      children: [
                        CustomImage(path: KImages.messageDubleIcon),
                        Utils.horizontalSpace(8),
                        CustomText(text: 'Send message'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: "share",
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Social Share',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Utils.horizontalLine(),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Share this link via',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Utils.verticalSpace(6),
                                  Row(
                                    children: [
                                      SocialMediaWidget(
                                        icon: KImages.facebookIcon,
                                      ),
                                      SocialMediaWidget(
                                        icon: KImages.linkedinIcon,
                                      ),
                                      SocialMediaWidget(
                                        icon: KImages.instaIcon,
                                      ),
                                      SocialMediaWidget(icon: KImages.xIcon),
                                    ],
                                  ),
                                  Utils.verticalSpace(10),
                                  CustomText(
                                    text: 'Copy Link',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Utils.verticalSpace(4),
                                  TextFormField(
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      hintText:
                                          'www.servingo.com/profile/0458...',
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.content_copy_rounded,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          CustomImage(path: KImages.socialShareIcon),
                          Utils.horizontalSpace(8),
                          CustomText(text: 'Share Social'),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: "report",
                    child: GestureDetector(
                      onTap: () {
                        ReportDialog.show(context);
                      },
                      child: Row(
                        children: [
                          CustomImage(path: KImages.reportIcon),
                          Utils.horizontalSpace(8),
                          CustomText(text: 'Report'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            ///============= Details Screen Heading Section ========///
            DetailScreenHeadingSection(),

            /// ============ Summary Section ==============///
            SummarySection(),

            ///============ Evidence Section =============///
            EvidenceSection(),

            ///=========== Respond Section ==============///
            RespondSection(),

            /// ============ Banner Section ============///
            DetailsBannerSection(),

            /// ============= Share Trip Container Section ============///
            ShareTripContainer(),

            ///============= Show Comment Section ==============///
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Comments',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                Utils.verticalSpace(12),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommentsContainer();
                  },
                ),
                Utils.verticalSpace(12),
              ],
            ),

            ///============= Add Comment Section ===============///
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Add a Comments',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Write Comment'),
                  keyboardType: TextInputType.emailAddress,
                ),
                Utils.verticalSpace(12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: Utils.symmetric(h: 30.0, v: 10.0),
                      decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: CustomText(text: 'Submit', color: whiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
