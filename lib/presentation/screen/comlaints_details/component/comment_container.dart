import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class CommentsContainer extends StatelessWidget {
  const CommentsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(v: 4.0, h: 12.0),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: scaffoldColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CustomImage(
              path: KImages.person,
              width: 36.w,
              height: 36.h,
              fit: BoxFit.cover,
            ),
            title: CustomText(text: 'Cody Lee', fontWeight: FontWeight.w600),
            subtitle: CustomText(
              text: 'April 14, 2025, 8:45 am',
              fontSize: 12,
              color: hintTextColor,
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ),
          Utils.verticalSpace(4),
          CustomText(
            text:
            'We apologize for the inconvenience. The service fee was a standard charge for amenities, But we understand it wasn’t',
            fontSize: 12,
            color: lightTextColor,
          ),
          Utils.verticalSpace(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImage(path: KImages.hardIcon),
                  CustomText(text: 'Helpful 2'),
                ],
              ),
              CustomImage(path: KImages.shareIcon),
            ],
          ),
        ],
      ),
    );
  }
}