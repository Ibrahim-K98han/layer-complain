import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Add photos, videos & documents evidence',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        Utils.verticalSpace(8),
        Utils.horizontalLine(),
        Utils.verticalSpace(12),
        CustomText(text: 'Upload (JPEG, PDF & PNG Max. Size 10MB)'),
        Utils.verticalSpace(4),
        Container(
          padding: Utils.symmetric(h: 5.0, v: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: inputFillColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                path: KImages.addImageIcon,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
              ),
              Utils.verticalSpace(8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: 'Drag & Drop or '),
                  CustomText(
                    text: 'Choose File',
                    color: blueColor,
                    decoration: TextDecoration.underline,
                    underLineColor: blueColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Utils.verticalSpace(12),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CustomImage(
            path: KImages.screenShort,
            width: 50.w,
            height: 40.h,
            fit: BoxFit.cover,
          ),
          title: CustomText(text: 'Screenshot.jpg'),
          subtitle: CustomText(text: '2.4 mb'),
          trailing: CustomImage(
            path: KImages.loadingIcon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ),
        ),
        Utils.verticalSpace(12),
      ],
    );
  }
}