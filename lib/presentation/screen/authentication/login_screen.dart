import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_complain/presentation/screen/authentication/component/remember_widget.dart';
import 'package:layer_complain/presentation/screen/authentication/component/social_login_widget.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/k_string.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: Utils.symmetric(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.verticalSpace(size.height * 0.10),
                CustomText(
                  text: KString.welcomeText,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                Utils.verticalSpace(10),
                CustomText(text: KString.welcomeSubText, color: lightTextColor),
                Utils.verticalSpace(40),
                CustomForm(
                  label: 'Email Address',
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Utils.verticalSpace(16.0),
                CustomForm(
                  label: 'Password',
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password here',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility_outlined,
                          color: textColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Utils.verticalSpace(6.0),

                ///================== Remember Widget ==================///
                RememberWidget(),
                Utils.verticalSpace(28.0),

                ///================== Sign In Button ==================///
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.mainScreen);
                  },
                ),
                Utils.verticalSpace(16.0),

                ///================== Dont have account ==================///
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.registerScreen);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t Have a Account? ',
                      style: GoogleFonts.dmSans(fontSize: 14, color: textColor),
                      children: [
                        TextSpan(
                          text: 'Create Now',
                          style: GoogleFonts.dmSans(
                            color: greenColor,
                            decoration: TextDecoration.underline,
                            decorationColor: greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Utils.verticalSpace(24.0),

                ///================== OR text ==================///
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(color: inputFillBorderColor),
                      ),
                    ),
                    Padding(
                      padding: Utils.symmetric(h: 10.0),
                      child: CustomText(text: 'OR'),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(color: inputFillBorderColor),
                      ),
                    ),
                  ],
                ),
                Utils.verticalSpace(36.0),

                ///================== Social Login ==================///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialLoginWidget(
                      onTap: () {},
                      icon: KImages.googleIcon,
                      text: 'Google',
                    ),
                    SocialLoginWidget(
                      onTap: () {},
                      icon: KImages.outlookIcon,
                      text: 'Outlook',
                    ),
                    SocialLoginWidget(
                      onTap: () {},
                      icon: KImages.appleIcon,
                      text: 'Apple',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
