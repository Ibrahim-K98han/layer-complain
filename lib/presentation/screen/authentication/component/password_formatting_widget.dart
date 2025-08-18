import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class PasswordFormattingWidget extends StatelessWidget {
  const PasswordFormattingWidget({
    super.key,
    this.iconColor,
    this.textColor,
    this.text,
  });

  final Color? iconColor;
  final Color? textColor;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.only(bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                path: KImages.rightMarkIcon,
                width: 20.w,
                height: 20.h,
                color: iconColor,
              ),
              Utils.horizontalSpace(8),
              CustomText(text: text ?? '', color: textColor ?? hintTextColor),
            ],
          ),
        ],
      ),
    );
  }
}