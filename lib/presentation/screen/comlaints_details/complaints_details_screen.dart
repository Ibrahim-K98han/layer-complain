import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import '../main_screen/component/main_controller.dart';
import 'component/comment_container.dart';
import 'component/details_banner_section.dart';
import 'component/details_heading_section.dart';
import 'component/evidence_section.dart';
import 'component/report_dialog.dart';
import 'component/respond_section.dart';
import 'component/share_trip_section.dart';
import 'component/social_media_widget.dart';
import 'component/summary_section.dart';

class ComplaintsDetailsScreen extends StatefulWidget {
  const ComplaintsDetailsScreen({super.key});

  @override
  State<ComplaintsDetailsScreen> createState() =>
      _ComplaintsDetailsScreenState();
}

class _ComplaintsDetailsScreenState extends State<ComplaintsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final MainController _controller = MainController();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        bgColor: whiteColor,
        title: 'Complaints',
        action: [
          PopupMenuButton(
            color: Colors.white,
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: "message",
                    child: GestureDetector(
                      onTap: () {
                        print("call");
                        Navigator.pushNamed(
                          context,
                          RouteNames.messageScreen,
                          arguments: {'showBack': true},
                        );

                        // _controller.naveListener.sink.add(2);
                      },
                      child: Row(
                        children: [
                          CustomImage(path: KImages.messageDubleIcon),
                          Utils.horizontalSpace(8),
                          CustomText(text: 'Send message'),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: "share",
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              // allow custom container shape
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 24.0,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Social Share',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Utils.horizontalLine(),
                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    // Content
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Share this link via',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                            SocialMediaWidget(
                                              icon: KImages.xIcon,
                                            ),
                                          ],
                                        ),
                                        Utils.verticalSpace(10),
                                        Text(
                                          'Copy Link',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                Utils.verticalSpace(4),
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
                      padding: Utils.symmetric(h: 30.0, v: 14.0),
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
            Utils.verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
