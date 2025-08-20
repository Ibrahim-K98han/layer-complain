import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class MessageSection extends StatelessWidget {
  const MessageSection({super.key, this.time, this.child, this.onTap});

  final String? time;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: CustomImage(
        path: KImages.person,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: 'Guy Hawkins', fontSize: 16,fontWeight: FontWeight.w500),
          CustomText(text: time ?? '', fontSize: 14, color: hintTextColor),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Good morning! I’m looking for...',
            color: hintTextColor,
          ),
          child ?? SizedBox(),
        ],
      ),
    );
  }
}
