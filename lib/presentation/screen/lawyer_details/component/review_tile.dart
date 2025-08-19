import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/primary_button.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        title: CustomText(
          text: 'All Over Reviews',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        children: [
          Column(
            children: [
              Column(
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: CustomImage(
                              path: KImages.person,
                              width: 40.w,
                              height: 40.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Utils.horizontalSpace(6),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(5, (index) {
                                    return CustomImage(
                                      path: KImages.starFileIcon,
                                    );
                                  }),
                                ),
                                Utils.verticalSpace(4),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Cody Lee',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      text: '2 days ago',
                                      color: lightTextColor,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text:
                                  'There are many variations of passages of available, but the in a some form humour, or randomised words which don\'t.',
                                  fontSize: 12,
                                ),
                                Utils.verticalSpace(8),
                                Row(
                                  children: [
                                    CustomImage(
                                      path: KImages.person,
                                      width: 28.w,
                                      height: 28.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Utils.horizontalSpace(8),
                                    CustomText(
                                      text:
                                      'Thank you so much for valuable Opinion',
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(color: hintTextColor.withOpacity(0.2)),
                    ],
                  );
                }),
              ),

              Utils.verticalSpace(16),
              Padding(
                padding: Utils.symmetric(h: 80),
                child: Container(
                  padding: Utils.symmetric(v: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: hintTextColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: CustomText(text: 'View All Reviews'),
                  ),
                ),
              ),
              Utils.verticalSpace(16),
              Container(
                padding: Utils.symmetric(h: 16.0, v: 12.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Review Now',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Utils.verticalSpace(8),
                    Row(
                      children: List.generate(5, (index) {
                        return CustomImage(
                          path: KImages.starFileIcon,
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        );
                      }),
                    ),
                    Utils.verticalSpace(8),
                    CustomForm(
                      label: 'Full Name',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                        ),
                      ),
                    ),
                    Utils.verticalSpace(8),
                    CustomForm(
                      label: 'Email Address',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Utils.verticalSpace(8),
                    CustomForm(
                      label: 'Write a Feedback',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Write Feedback',
                        ),
                      ),
                    ),
                    Utils.verticalSpace(16),
                    PrimaryButton(
                      minimumSize: Size(200, 46),
                      bgColor: textColor,
                      text: 'Submit Review',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
