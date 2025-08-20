import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Account Delete'),
      bottomNavigationBar: Container(
        height: 105,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(
                0,
                -2,
              ), // Changed to negative for upward shadow
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: Utils.symmetric(h: 16.0, v: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: Utils.symmetric(h: 4.0, v: 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: hintTextColor),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        text: 'Cancel',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Utils.horizontalSpace(16),
                Expanded(child: PrimaryButton(text: 'Yes', onPressed: () {})),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          Utils.verticalSpace(16.0),
          Center(
            child: CustomText(
              text: 'Are you Sure Delete your Account',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
            child: CustomText(
              text: 'For verification purpose fille down inputs ',
              color: lightTextColor,
            ),
          ),
          Utils.verticalSpace(20.0),
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
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_outlined,
                    color: textColor,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
