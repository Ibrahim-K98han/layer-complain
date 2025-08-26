import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import '../../../widgets/custom_form.dart';
import '../../../widgets/primary_button.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: scaffoldColor,
        title: 'All Reviews',
        titleCenter: true,
        action: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierColor: textColor.withOpacity(0.5),
                builder: (context) {
                  return ShowAddReviewDialog();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  CustomImage(path: KImages.addFileIcon),
                  Utils.horizontalSpace(4),
                  CustomText(text: 'Add'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ReviewContainer();
        },
      ),
    );
  }
}

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: Container(
        padding: Utils.symmetric(h: 12.0, v: 20.0),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(text: 'Complaint #56789', color: lightTextColor),
                  ],
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder:
                          (context, _) =>
                              CustomImage(path: KImages.starFileIcon),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Utils.horizontalSpace(8),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierColor: textColor.withOpacity(0.5),
                          builder: (context) {
                            return ShowAddReviewDialog();
                          },
                        );
                      },
                      child: Container(
                        padding: Utils.symmetric(h: 10.0, v: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: inputFillBorderColor),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: CustomImage(
                          path: KImages.editIcon,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Utils.verticalSpace(8),
            CustomText(
              text: '"Helpful Legal Advice"',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowAddReviewDialog extends StatelessWidget {
  const ShowAddReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Center(
              child: CustomText(
                textAlign: TextAlign.center,
                text: 'Review Now',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            Utils.verticalSpace(16),

            // Rating Stars
            Center(
              child: RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 24,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder:
                    (context, _) => CustomImage(path: KImages.starFileIcon),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),

            Utils.verticalSpace(16),

            // Feedback field
            CustomForm(
              label: 'Write a Feedback',
              child: TextFormField(
                maxLines: 2,
                decoration: const InputDecoration(hintText: 'Write a Feedback'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            Utils.verticalSpace(16),

            // Submit Button
            PrimaryButton(
              bgColor: textColor,
              text: 'Submit Reviews',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
