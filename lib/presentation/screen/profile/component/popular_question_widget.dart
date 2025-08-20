import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class PopularQuestionWidget extends StatelessWidget {
  const PopularQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: Utils.symmetric(h: 12.0, v: 8.0),
      decoration: BoxDecoration(
        color: scaffoldColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: Utils.all(value: 8.r),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CustomImage(path: KImages.photoIcon),
              ),
              CustomText(
                text: 'Adding a photo using the ConsCom',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Utils.verticalSpace(12),
          CustomText(
            text:
                'Condimentum ullamcorper venenatis gravida magnis sem dictumst varius. Velit, est interdum',
            fontSize: 12,
            color: lightTextColor,
          ),
          Utils.verticalSpace(10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.questionScreen);
            },
            child: Row(
              children: [
                CustomText(text: 'Learn more'),
                CustomImage(path: KImages.arrowRightIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
