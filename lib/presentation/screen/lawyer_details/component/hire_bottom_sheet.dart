import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/primary_button.dart';

class HireBottomSheet extends StatefulWidget {
  const HireBottomSheet({super.key});

  @override
  State<HireBottomSheet> createState() => _HireBottomSheetState();
}

class _HireBottomSheetState extends State<HireBottomSheet> {
  String? selectedCountryValue;
  final List<String> countryValue = ['Bangladesh', 'Pakistan', 'Afghanistan'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Hire now',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImage(
                  path: KImages.closeIcon,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Utils.horizontalLine(),
          Utils.verticalSpace(16),
          CustomForm(
            label: 'Type of Legal Service',
            child: DropdownButtonFormField<String>(
              dropdownColor: whiteColor,
              value: selectedCountryValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              hint: CustomText(text: 'Bangladesh', color: hintTextColor),
              items:
                  countryValue.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomText(text: value, fontSize: 14),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountryValue = newValue;
                });
              },
              validator:
                  (value) => value == null ? 'Please select an option' : null,
            ),
          ),

          Utils.verticalSpace(8),
          CustomForm(
            label: 'Preferred Date',
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Preferred Date',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomImage(
                      path: KImages.calenderIcon,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Time Slot',
            child: DropdownButtonFormField<String>(
              dropdownColor: whiteColor,
              value: selectedCountryValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              hint: CustomText(text: 'Bangladesh', color: hintTextColor),
              items:
                  countryValue.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomText(text: value, fontSize: 14),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountryValue = newValue;
                });
              },
              validator:
                  (value) => value == null ? 'Please select an option' : null,
            ),
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Offer Amount',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'offer amount'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Brief Description of Issue',
            child: TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Brief Description of Issue',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Utils.verticalSpace(8),
          CustomText(text: 'Upload Related Documents'),
          Utils.verticalSpace(4),
          Row(
            children: [
              DottedBorder(
                color: hintTextColor,
                strokeWidth: 1,
                dashPattern: [5, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(4.r),
                child: Container(
                  padding: Utils.symmetric(v: 10.0),
                  child: Row(
                    children: [
                      CustomImage(path: KImages.addImageIcon),
                      CustomText(text: 'File Upload'),
                    ],
                  ),
                ),
              ),
              Utils.horizontalSpace(10),
              CustomText(text: '01_document.pdf'),
            ],
          ),

          Utils.verticalSpace(16),
          PrimaryButton(
            bgColor: textColor,
            text: 'Hire Now',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image
                          CustomImage(
                            path: KImages.successSubscription,
                            width: 110.w,
                            height: 110.h,
                            fit: BoxFit.cover,
                          ),

                          Utils.verticalSpace(16),

                          // Title text
                          CustomText(
                            text: 'Your Legal Request\nhas Been Submitted!',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),

                          Utils.verticalSpace(20),

                          // Button
                          PrimaryButton(
                            text: 'That’s Nice',
                            bgColor: textColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );

                },
              );
            },
          ),
          Utils.verticalSpace(16),
        ],
      ),
    );
  }
}
