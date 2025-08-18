import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

class OtpSuccess extends StatelessWidget {
  const OtpSuccess({super.key});

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
            ),
            Utils.verticalSpace(20),
            CustomText(
              textAlign: TextAlign.center,
              text: 'Successfully Verify\n your OTP',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            Utils.verticalSpace(32),
            Padding(
              padding: Utils.symmetric(),
              child: PrimaryButton(
                text:
                    'Return to'
                    ' Sign In',
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
