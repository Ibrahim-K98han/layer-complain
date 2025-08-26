import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class EvidenceSection extends StatelessWidget {
  EvidenceSection({super.key});

  final List<Map<String, dynamic>> evidenceList = [
    {'image': KImages.evidence, 'text': 'Book Confirmation'},
    {'image': KImages.evidence, 'text': 'Hotel Receipt'},
    {'image': KImages.evidence, 'text': 'Screenshot'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.verticalSpace(16),
        CustomText(text: 'Evidence', fontSize: 16, fontWeight: FontWeight.w500),
        Utils.verticalSpace(8),
        Container(
          padding: Utils.symmetric(h: 10.0, v: 10.0),
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(evidenceList.length, (index) {
              return EvidenceImage(
                image: evidenceList[index]['image'],
                text: evidenceList[index]['text'],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class EvidenceImage extends StatelessWidget {
  const EvidenceImage({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder:
                  (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CustomImage(
                        path: image,
                        width: double.infinity,
                        height: 300.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CustomImage(
              path: image,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Utils.verticalSpace(4),
        CustomText(text: text, fontSize: 11, fontWeight: FontWeight.w500),
      ],
    );
  }
}
