import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class ImageSubContainer extends StatelessWidget {
  const ImageSubContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.imgColor,
  });

  final String image;
  final String title;
  final String subTitle;
  final Color bgColor;
  final Color imgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: CustomImage(path: image, color: imgColor),
          ),
          Utils.horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: title, fontWeight: FontWeight.w600),
              CustomText(text: subTitle, fontSize: 12),
            ],
          ),
        ],
      ),
    );
  }
}
