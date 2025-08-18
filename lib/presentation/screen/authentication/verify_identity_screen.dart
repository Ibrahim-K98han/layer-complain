import 'package:flutter/material.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import 'component/identity_phone_email.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({super.key});

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
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
            Navigator.pushNamed(context, RouteNames.phoneNumberVerifyScreen);
          },
        ),
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'Verify your identity',
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text:
                  'Your identity helps you discover new people and opportunities',
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
