import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/language_widget.dart';
import '../../../widgets/professional_title_widget.dart';
import 'component/agree_widget.dart';

class BecomeALawyerScreen extends StatefulWidget {
  const BecomeALawyerScreen({super.key});

  @override
  State<BecomeALawyerScreen> createState() => _BecomeALawyerScreenState();
}

class _BecomeALawyerScreenState extends State<BecomeALawyerScreen> {
  String? selectedYearValue;
  String? selectedInstituteValue;
  String? selectedStartValue;
  String? selectedEndValue;

  final List<String> yearItems = ['2021', '2022', '2023', '2024'];
  final List<String> instituteItems = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  final List<String> startItems = [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
  ];
  final List<String> endItems = ['5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Become a Lawyer'),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomForm(
                      label: 'First Name',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(12),
                  Expanded(
                    child: CustomForm(
                      label: 'Last Name',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(12),
              CustomForm(
                label: 'Email Address',
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Utils.verticalSpace(12),
              CustomText(text: 'Phone Number', fontSize: 14),
              Utils.verticalSpace(4.0),
              IntlPhoneField(
                initialCountryCode: 'BD',
                decoration: InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                flagsButtonPadding: const EdgeInsets.all(4),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              Utils.verticalSpace(12),
              CustomForm(
                label: 'Professional Title',
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Professional Title',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Utils.verticalSpace(12),
              Row(
                children: [
                  Expanded(
                    child: CustomForm(
                      label: 'Years of Experience',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Years of Experience',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(12),
                  Expanded(
                    child: CustomForm(
                      label: 'Licence Number',
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Licence Number',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(12.0),
              CustomText(text: 'Professional Title'),
              Utils.verticalSpace(4.0),
              Container(
                padding: Utils.symmetric(h: 14.0, v: 14.0),
                decoration: BoxDecoration(
                  color: scaffoldColor,
                  border: Border.all(color: inputFillBorderColor),
                  borderRadius: BorderRadiusDirectional.circular(6),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ProfessionalTitle(),
                    ProfessionalTitle(),
                    ProfessionalTitle(),
                    ProfessionalTitle(),
                  ],
                ),
              ),
              Utils.verticalSpace(12.0),
              CustomText(text: 'Language'),
              Utils.verticalSpace(4.0),
              Container(
                padding: Utils.symmetric(h: 14.0, v: 14.0),
                decoration: BoxDecoration(
                  color: scaffoldColor,
                  border: Border.all(color: inputFillBorderColor),
                  borderRadius: BorderRadiusDirectional.circular(6),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    LanguageWidget(),
                    LanguageWidget(),
                    LanguageWidget(),
                  ],
                ),
              ),
              Utils.verticalSpace(12.0),
              CustomText(
                text: 'Education Background',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(12.0),
              CustomForm(
                label: 'Degree',
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Degree'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Utils.verticalSpace(12.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        CustomForm(
                          label: 'Institution',
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Institution',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.add, color: blueColor, size: 16),
                            CustomText(
                              text: 'Add',
                              color: blueColor,
                              decoration: TextDecoration.underline,
                              underLineColor: blueColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Utils.horizontalSpace(12),
                  Expanded(
                    child: Column(
                      children: [
                        CustomForm(
                          label: 'End Year',
                          child: DropdownButtonFormField<String>(
                            dropdownColor: whiteColor,
                            value: selectedYearValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                            ),
                            hint: CustomText(
                              text: '2021',
                              color: hintTextColor,
                            ),
                            items:
                                yearItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: CustomText(
                                      text: value,
                                      fontSize: 16,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedYearValue = newValue;
                              });
                            },
                            validator:
                                (value) =>
                                    value == null
                                        ? 'Please select an option'
                                        : null,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.close, color: primaryColor, size: 16),
                            CustomText(
                              text: 'Remove',
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                              underLineColor: primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(12.0),
              CustomText(
                text: 'Availability',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomForm(
                          label: 'Institution',
                          child: DropdownButtonFormField<String>(
                            dropdownColor: whiteColor,
                            value: selectedInstituteValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 12,
                              ),
                            ),
                            hint: CustomText(
                              text: '2021',
                              color: hintTextColor,
                            ),
                            items:
                                instituteItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: CustomText(
                                      text: value,
                                      fontSize: 14,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedInstituteValue = newValue;
                              });
                            },
                            validator:
                                (value) =>
                                    value == null
                                        ? 'Please select an option'
                                        : null,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.add, color: blueColor, size: 16),
                            CustomText(
                              text: 'Add',
                              color: blueColor,
                              decoration: TextDecoration.underline,
                              underLineColor: blueColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Expanded(
                    child: CustomForm(
                      label: 'Start',
                      child: DropdownButtonFormField<String>(
                        dropdownColor: whiteColor,
                        value: selectedStartValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 12,
                          ),
                        ),
                        hint: CustomText(text: '2021', color: hintTextColor),
                        items:
                            startItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomText(text: value, fontSize: 14),
                              );
                            }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStartValue = newValue;
                          });
                        },
                        validator:
                            (value) =>
                                value == null
                                    ? 'Please select an option'
                                    : null,
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Expanded(
                    child: Column(
                      children: [
                        CustomForm(
                          label: 'End',
                          child: DropdownButtonFormField<String>(
                            dropdownColor: whiteColor,
                            value: selectedEndValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 12,
                              ),
                            ),
                            hint: CustomText(
                              text: '2021',
                              color: hintTextColor,
                            ),
                            items:
                                endItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: CustomText(
                                      text: value,
                                      fontSize: 14,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedEndValue = newValue;
                              });
                            },
                            validator:
                                (value) =>
                                    value == null
                                        ? 'Please select an option'
                                        : null,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.close, color: primaryColor, size: 16),
                            CustomText(
                              text: 'Remove',
                              color: primaryColor,
                              decoration: TextDecoration.underline,
                              underLineColor: primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(12.0),
              AgreeWidget(),
              Utils.verticalSpace(24.0),
              PrimaryButton(
                bgColor: textColor,
                text: 'Submit now',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
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
                              // Success Image
                              CustomImage(
                                path: KImages.successComplain,
                                width: 132.w,
                                height: 110.h,
                                fit: BoxFit.cover,
                              ),

                              Utils.verticalSpace(12),

                              // Message Text
                              CustomText(
                                textAlign: TextAlign.center,
                                text:
                                    'Application under Review,\nWe’ll Contact you Shortly.',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),

                              Utils.verticalSpace(20),

                              // Button
                              PrimaryButton(
                                bgColor: textColor,
                                text: 'That\'s Nice',
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
              Utils.verticalSpace(12.0),
            ],
          ),
        ),
      ),
    );
  }
}
