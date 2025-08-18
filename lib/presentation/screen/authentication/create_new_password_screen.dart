import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../widgets/custom_form.dart';
import 'component/password_formatting_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CustomImage(
                    path: KImages.verifyPhoneEmail,
                    width: 72.w,
                    height: 72.h,
                    fit: BoxFit.cover,
                  ),
                  Utils.verticalSpace(20),
                  CustomText(
                    text: 'Create new Password',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text:
                        'Your new password must be different from\n previous password.',
                    color: lightTextColor,
                  ),
                  Utils.verticalSpace(20),
                  CustomForm(
                    label: 'Password',
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Utils.verticalSpace(16),
                  CustomForm(
                    label: 'Confirm Password',
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Utils.verticalSpace(16),
                  PasswordFormattingWidget(
                    text: 'Must not contain your name or email',
                    iconColor: greenColor,
                    textColor: greenColor,
                  ),
                  PasswordFormattingWidget(
                    text: 'At least 8 characters',
                    textColor: hintTextColor,
                    iconColor: hintTextColor,
                  ),
                  PasswordFormattingWidget(
                    text: 'Contains a symbol or a number',
                    textColor: hintTextColor,
                    iconColor: hintTextColor,
                  ),
                  Utils.verticalSpace(100),
                  PrimaryButton(
                    text: 'Create a New Password',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.successPasswordScreen,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
