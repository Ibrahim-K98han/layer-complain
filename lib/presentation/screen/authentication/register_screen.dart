import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_complain/presentation/screen/authentication/component/company_register_form.dart';
import 'package:layer_complain/presentation/screen/authentication/component/individual_register_form.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../routes/route_names.dart';
import 'component/lawyer_register_form.dart';
import 'component/social_login_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: ''),

      ///================ Sign Up Button Section =============///
      bottomNavigationBar: Container(
        padding: EdgeInsets.zero,
        height: 235.h,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: textColor.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: Utils.symmetric(),
          child: Column(
            children: [
              Utils.verticalSpace(28),

              ///=============== Sign Up button ================///
              PrimaryButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.verifyIdentityScreen);
                },
              ),
              Utils.verticalSpace(16),

              ///============ Already Have account text ============///
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have an Account? ',
                    style: GoogleFonts.dmSans(fontSize: 14, color: textColor),
                    children: [
                      TextSpan(
                        text: 'Sign In',
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
              Utils.verticalSpace(20.0),

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
              Utils.verticalSpace(16.0),

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
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            CustomText(
              text:
                  _selectedIndex == 0
                      ? 'Join ConsCom in Just a Minute'
                      : _selectedIndex == 1
                      ? 'Join as a Lawyer on ConsCom'
                      : 'Join as a Verified Business',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: 'Create an account raise & resolve complaints easily.',
              color: lightTextColor,
              fontSize: 13,
            ),
            Utils.verticalSpace(16),
            TabBar(
              padding: EdgeInsets.zero,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: primaryColor,
              unselectedLabelColor: textColor,
              indicator: BoxDecoration(
                color: primaryLightColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              tabs: [
                _buildTab(KImages.individualIcon, "Individual", 0),
                _buildTab(KImages.lawyerIcon, "Lawyer", 1),
                _buildTab(KImages.companyIcon, "Company", 2),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ///============ Individual Register Form ============
                  IndividualRegisterForm(),

                  ///============ Lawyer Register Form ============
                  LawyerRegisterForm(),

                  ///============== Company Register Form =============
                  CompanyRegisterForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String iconPath, String label, int index) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? primaryColor : textColor;

    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(path: iconPath, width: 16, height: 16, color: color),
          Utils.horizontalSpace(1),
          CustomText(text: label, color: color),
        ],
      ),
    );
  }
}
