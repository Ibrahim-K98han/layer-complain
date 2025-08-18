
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/details/component/social_media_widget.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import 'contact_widget.dart';

class ShareTripContainer extends StatelessWidget {
  const ShareTripContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: Utils.symmetric(h: 12.0, v: 12.0),
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomImage(
                    path: KImages.shareTrip,
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Share Trip',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(text: 'Travel Agency ', color: hintTextColor),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(10),
              ContactWidget(icon: KImages.callIcon, text: '+0145454554'),
              ContactWidget(icon: KImages.gmailIcon, text: 'share@gmail.com'),
              ContactWidget(
                icon: KImages.locationIcon,
                text: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
              ),
              Utils.verticalSpace(10),
              CustomText(
                text: 'Social Media',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Utils.verticalSpace(8),
              Row(
                children: [
                  SocialMediaWidget(icon: KImages.facebookIcon),
                  SocialMediaWidget(icon: KImages.linkedinIcon),
                  SocialMediaWidget(icon: KImages.instaIcon),
                  SocialMediaWidget(icon: KImages.xIcon),
                  SocialMediaWidget(icon: KImages.youtubeIcon),
                ],
              ),
              Utils.verticalSpace(8),
              Container(
                padding: Utils.symmetric(h: 8.0, v: 4.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F2F4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomImage(
                    path: KImages.person,
                    width: 32.w,
                    height: 32.h,
                    fit: BoxFit.cover,
                  ),
                  title: CustomText(text: 'Checked & verified by Cody Le'),
                  subtitle: CustomText(text: 'May 10, 2025'),
                ),
              ),
            ],
          ),
        ),
        Utils.verticalSpace(16),
      ],
    );
  }
}


