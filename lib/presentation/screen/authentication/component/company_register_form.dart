import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_text.dart';

class CompanyRegisterForm extends StatefulWidget {
  const CompanyRegisterForm({super.key});

  @override
  State<CompanyRegisterForm> createState() => _CompanyRegisterFormState();
}

class _CompanyRegisterFormState extends State<CompanyRegisterForm> {
  String? selectedCountryValue;
  String? selectedCityValue;
  String? selectedStateValue;

  final List<String> countryValue = ['Bangladesh', 'Pakistan', 'Afghanistan'];
  final List<String> cityValue = ['Dhaka', 'Khulna', 'Chittagong'];
  final List<String> stateValue = ['Mirpur', 'Dhanmondi', 'Uttara'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpace(20.0),
          CustomForm(
            label: 'Company Name',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Company Name'),
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Company Title (Optional)',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Company Title'),
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Email Address (Official)',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomText(text: 'Phone Number', fontSize: 16),
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
          Utils.verticalSpace(12.0),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  label: 'Country',
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
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountryValue = newValue;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ),
              Utils.horizontalSpace(16),
              Expanded(
                child: CustomForm(
                  label: 'City',
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedCityValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    hint: CustomText(text: 'Dhaka', color: hintTextColor),
                    items:
                        cityValue.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCityValue = newValue;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12.0),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  label: 'State',
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedStateValue,
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
                        stateValue.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedStateValue = newValue;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ),
              Utils.horizontalSpace(16),
              Expanded(
                child: CustomForm(
                  label: 'Zip Code',
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: '9002'),
                  ),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Address (Office)',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Address'),
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Password',
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_outlined,size: 20,),
              ),
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Confirm Password',
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                suffixIcon: Icon(Icons.visibility_outlined,size: 20,),
              ),
            ),
          ),
          Utils.verticalSpace(4.0),
          _buildAgree(context),
        ],
      ),
    );
  }

  Widget _buildAgree(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: primaryColor,
          value: true,
          onChanged: (value) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By signing up, you agree to our ',
              style: GoogleFonts.dmSans(fontSize: 14, color: hintTextColor),
              children: [
                TextSpan(
                  text: 'Term of Service',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: hintTextColor,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfessionalTitle extends StatelessWidget {
  const ProfessionalTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 8.0, v: 4.0),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: 'Consumer Rights'),
          Utils.horizontalSpace(4),
          CustomImage(
            path: KImages.closeBlackIcon,
            width: 10.w,
            height: 10.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 8.0, v: 4.0),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: 'English'),
          Utils.horizontalSpace(4),
          CustomImage(
            path: KImages.closeBlackIcon,
            width: 10.w,
            height: 10.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
