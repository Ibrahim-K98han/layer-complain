import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: Utils.symmetric(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.verticalSpace(20),
              CustomImage(
                path: KImages.verifyOTP,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
              Utils.verticalSpace(20),
              CustomText(
                text: 'Verify OTP',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: 'You get OTP via SMS',
                color: lightTextColor,
              ),
              Utils.verticalSpace(20),
              Pinput(
                length: 4,
                focusedPinTheme: PinTheme(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: Utils.vSize(46.0),
                  width: Utils.hSize(46.0),
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: primaryColor),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                defaultPinTheme: PinTheme(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: Utils.vSize(46.0),
                  width: Utils.hSize(46.0),
                  textStyle: GoogleFonts.dmSans(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: inputFillBorderColor),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onChanged: (String code) {},
                onCompleted: (String code) {},
              ),
              Utils.verticalSpace(100),
              PrimaryButton(
                text: 'Verify',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.otpSuccess);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
