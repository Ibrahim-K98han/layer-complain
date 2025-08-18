import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, this.icon, this.text});

  final String? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          CustomImage(path: icon, width: 16.w, height: 16.h, fit: BoxFit.cover),
          Utils.horizontalSpace(4),
          CustomText(text: text ?? ''),
        ],
      ),
    );
  }
}
