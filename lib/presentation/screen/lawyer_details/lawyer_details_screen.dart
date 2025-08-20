import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/lawyer_details/component/about_tile.dart';
import 'package:layer_complain/presentation/screen/lawyer_details/component/review_tile.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import '../comlaints_details/component/social_media_widget.dart';
import 'component/experience_and_notable.dart';
import 'component/hire_bottom_sheet.dart';
import 'component/lawyer_details_heading.dart';
import 'component/message_bottom_sheet.dart';
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
                              SocialMediaWidget(icon: KImages.facebookIcon),
                              SocialMediaWidget(icon: KImages.linkedinIcon),
                              SocialMediaWidget(icon: KImages.instaIcon),
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
                              hintText: 'www.servingo.com/profile/0458...',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.content_copy_rounded),
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
              child: CustomImage(path: KImages.shareRightIcon),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: Utils.symmetric(h: 16.0, v: 8.0),
        height: 100.h,
        decoration: BoxDecoration(

          color: whiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),

          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: whiteColor,
                    constraints: BoxConstraints.loose(
                      Size(
                        Utils.mediaQuery(context).width,
                        Utils.mediaQuery(context).height * 0.9,
                      ),
                    ),
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Utils.radius(20.0)),
                        topRight: Radius.circular(Utils.radius(20.0)),
                      ),
                    ),
                    builder:
                        (context) => DraggableScrollableSheet(
                          initialChildSize: 0.85,
                          minChildSize: 0.5,
                          maxChildSize: 0.95,
                          expand: false,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: MessageBottomSheet(),
                            );
                          },
                        ),
                  );
                },
                child: Container(
                  padding: Utils.symmetric(v: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: hintTextColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      CustomImage(path: KImages.messageDubleIcon),
                      Utils.horizontalSpace(12.0),
                      CustomText(text: 'Message'),
                    ],
                  ),
                ),
              ),
            ),
            Utils.horizontalSpace(16.0),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: whiteColor,
                    constraints: BoxConstraints.loose(
                      Size(
                        Utils.mediaQuery(context).width,
                        Utils.mediaQuery(context).height * 0.9,
                      ),
                    ),
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Utils.radius(20.0)),
                        topRight: Radius.circular(Utils.radius(20.0)),
                      ),
                    ),
                    builder:
                        (context) => DraggableScrollableSheet(
                          initialChildSize: 0.85,
                          minChildSize: 0.5,
                          maxChildSize: 0.95,
                          expand: false,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: HireBottomSheet(),
                            );
                          },
                        ),
                  );
                },
                child: Container(
                  padding: Utils.symmetric(v: 10.0),
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      CustomImage(path: KImages.hireIcon),
                      Utils.horizontalSpace(12.0),
                      CustomText(text: 'Hire now', color: whiteColor),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
