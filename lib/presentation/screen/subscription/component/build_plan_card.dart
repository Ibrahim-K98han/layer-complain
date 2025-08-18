import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class BuildPanCar extends StatefulWidget {
  const BuildPanCar({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.color,
    required this.textColor,
    required this.icon,
    required this.isPopular,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String price;
  final String subtitle;
  final Color color;
  final Color textColor;
  final String icon;
  final bool isPopular;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<BuildPanCar> createState() => _BuildPanCarState();
}

class _BuildPanCarState extends State<BuildPanCar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          if (widget.isPopular)
            Container(
              width: double.infinity,
              padding: Utils.symmetric(v: 4.0, h: 0.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Most Popular',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          Container(
            margin: Utils.symmetric(v: 2.0, h: 0.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: Utils.symmetric(h: 10.0, v: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.verticalSpace(10.0),
                  Row(
                    children: [
                      CustomImage(path: widget.icon),
                      SizedBox(width: 12),
                      CustomText(
                        text: widget.title,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: widget.price,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: '/Month',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: widget.isSelected ? primaryColor : whiteColor,
                          border: Border.all(
                            color:
                                widget.isSelected
                                    ? primaryColor
                                    : hintTextColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomImage(path: KImages.rightIcon),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  CustomText(
                    text: widget.subtitle,
                    fontSize: 12,
                    color: hintTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
