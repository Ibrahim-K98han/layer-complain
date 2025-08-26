import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import 'image_sub_circle_container.dart';

class ImageSubCircleContainer extends StatelessWidget {
  const ImageSubCircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 15.0, v: 14.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        children: [
          CustomText(text: '58M+ ', fontWeight: FontWeight.w600),
          CustomText(text: 'Happy Clients'),
          Utils.horizontalSpace(8),
          Stack(
            children: [
              SizedBox(width: 110, height: 30),
              Positioned(
                child: CustomImage(
                  path: KImages.person,
                  width: 28.w,
                  height: 28.h,
                ),
              ),
              Positioned(
                left: 20,
                child: ImageContainer(image: KImages.person),
              ),
              Positioned(
                left: 40,
                child: ImageContainer(image: KImages.person),
              ),
              Positioned(
                left: 60,
                child: ImageContainer(image: KImages.person),
              ),
              Positioned(
                left: 80,
                child: ImageContainer(image: KImages.addCircleIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: whiteColor, width: 2),
        shape: BoxShape.circle,
      ),
      child: CustomImage(path: image, width: 28.w, height: 28.h),
    );
  }
}
