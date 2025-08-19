import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class LawyerConsumerItem extends StatelessWidget {
  const LawyerConsumerItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          CustomImage(path: image),
          Utils.horizontalSpace(4),
          CustomText(text: title, fontSize: 12),
          CustomText(text: subTitle, fontWeight: FontWeight.w500, fontSize: 12),
        ],
      ),
    );
  }
}
