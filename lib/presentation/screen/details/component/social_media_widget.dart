import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_image.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key, this.icon});

  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CustomImage(
            path: icon,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}