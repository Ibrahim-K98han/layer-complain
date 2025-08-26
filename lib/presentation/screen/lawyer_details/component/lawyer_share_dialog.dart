import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';
import '../../comlaints_details/component/social_media_widget.dart';

class LawyerShareDialog extends StatelessWidget {
  const LawyerShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            CustomText(
              text: 'Social Share',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            Utils.horizontalLine(),
            Utils.verticalSpace(8),

            // Subtitle
            CustomText(
              text: 'Share this link via',
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(6),

            // Social Icons
            Row(
              children: [
                SocialMediaWidget(icon: KImages.facebookIcon),
                SocialMediaWidget(icon: KImages.linkedinIcon),
                SocialMediaWidget(icon: KImages.instaIcon),
                SocialMediaWidget(icon: KImages.xIcon),
              ],
            ),

            Utils.verticalSpace(10),

            // Copy Link
            CustomText(
              text: 'Copy Link',
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(4),

            // Link Field
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'www.servingo.com/profile/0458...',
                suffixIcon: IconButton(
                  onPressed: () {
                    // TODO: Copy link logic
                  },
                  icon: const Icon(Icons.content_copy_rounded),
                ),
              ),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
      ),
    );

  }
}
