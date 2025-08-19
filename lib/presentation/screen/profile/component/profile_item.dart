import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: Utils.only(bottom: 14),
        child: Row(
          children: [
            CustomImage(
              path: image,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
            Utils.horizontalSpace(8),
            CustomText(text: title, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}