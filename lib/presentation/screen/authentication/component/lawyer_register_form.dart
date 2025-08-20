import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/language_widget.dart';
import '../../../../widgets/professional_title_widget.dart';

class LawyerRegisterForm extends StatefulWidget {
  const LawyerRegisterForm({super.key});

  @override
  State<LawyerRegisterForm> createState() => _LawyerRegisterFormState();
}

class _LawyerRegisterFormState extends State<LawyerRegisterForm> {
  String? selectedValue;

  final List<String> items = ['2-5 years', '5-10 years'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpace(20.0),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  label: 'First Name',
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ),
                ),
              ),
              Utils.horizontalSpace(16),
              Expanded(
                child: CustomForm(
                  label: 'Last Name',
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Last Name'),
                  ),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Email Address',
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
          CustomForm(
            label: 'Professional Title',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Professional Title'),
            ),
          ),
          Utils.verticalSpace(12.0),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  label: 'Years of Experience',
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    hint: CustomText(text: '2-5 years', color: hintTextColor),
                    items:
                        items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
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
                  label: 'License Number',
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'License Number',
                    ),
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
              children: [LanguageWidget(), LanguageWidget(), LanguageWidget()],
            ),
          ),
          Utils.verticalSpace(12.0),
          CustomForm(
            label: 'Password',
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_outlined),
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
                suffixIcon: Icon(Icons.visibility_outlined),
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


