import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import '../../../routes/route_names.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';
import '../../../widgets/primary_button.dart';

class PhoneNumberOrEmailVerifyScreen extends StatefulWidget {
  const PhoneNumberOrEmailVerifyScreen({super.key});

  @override
  State<PhoneNumberOrEmailVerifyScreen> createState() =>
      _PhoneNumberOrEmailVerifyScreenState();
}

class _PhoneNumberOrEmailVerifyScreenState
    extends State<PhoneNumberOrEmailVerifyScreen> {
  bool isEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,

      appBar: CustomAppBar(title: ''),

      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Utils.verticalSpace(20),
            CustomImage(
              path: KImages.verifyPhoneEmail,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
            isEmail == false
                ? CustomText(
                  text: 'Verify Email Address',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )
                : CustomText(
                  text: 'Verify Phone Number',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
            CustomText(
              textAlign: TextAlign.center,
              text:
                  'Your identity helps you discover new people and opportunities',
              color: lightTextColor,
            ),
            Utils.verticalSpace(20),
            isEmail == false
                ? SizedBox.shrink()
                : Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: 'Phone Number', fontSize: 16),
                ),
            Utils.verticalSpace(4.0),
            isEmail == false
                ? CustomForm(
                  label: 'Email Address',
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                )
                : IntlPhoneField(
                  initialCountryCode: 'BD',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  flagsButtonPadding: const EdgeInsets.all(4),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
            Utils.verticalSpace(80),
            PrimaryButton(
              text: 'Get OTP',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.otpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
