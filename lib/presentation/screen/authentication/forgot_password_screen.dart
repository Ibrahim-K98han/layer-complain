import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../routes/route_names.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/primary_button.dart';
import 'component/identity_phone_email.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: ''),
      bottomNavigationBar: Padding(
        padding: Utils.symmetric(v: 10.0),
        child: PrimaryButton(
          text: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.createNewPasswordScreen);
          },
        ),
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(
              path: KImages.verifyPhoneEmail,
              width: 72.w,
              height: 72.h,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Can’t Sign In?',
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text:
                  'Enter your email or Phone number ConsCom will send a password reset link.',
              color: lightTextColor,
            ),
            Utils.verticalSpace(20),
            IdentityPhoneEmail(
              onTap: () {},
              icon: KImages.emailIcon,
              title: 'Email',
              subTitle: 'Verify with your email',
            ),
            Utils.verticalSpace(16),
            IdentityPhoneEmail(
              onTap: () {},
              icon: KImages.phoneIcon,
              title: 'Phone Number',
              subTitle: 'Verify with your phone number',
            ),
          ],
        ),
      ),
    );
  }
}
