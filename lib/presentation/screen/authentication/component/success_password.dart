import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../../utils/constraints.dart';

class SuccessPassword extends StatefulWidget {
  const SuccessPassword({super.key});

  @override
  State<SuccessPassword> createState() => _SuccessPasswordState();
}

class _SuccessPasswordState extends State<SuccessPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              path: KImages.verifyPhoneEmail,
              width: 72.w,
              height: 72.h,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Password Change',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: 'Awesome. You’re successfully updated\n your password.',
              color: lightTextColor,
            ),
            Utils.verticalSpace(20),
            Padding(
              padding: Utils.symmetric(),
              child: PrimaryButton(
                text: 'Return to Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
