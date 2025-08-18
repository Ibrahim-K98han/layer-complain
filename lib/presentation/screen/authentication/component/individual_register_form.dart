import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_text.dart';

class IndividualRegisterForm extends StatefulWidget {
  const IndividualRegisterForm({super.key});

  @override
  State<IndividualRegisterForm> createState() => _IndividualRegisterFormState();
}

class _IndividualRegisterFormState extends State<IndividualRegisterForm> {
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
