import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        title: 'Password Change',
        titleCenter: true,
        visibleLeading: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: PrimaryButton(text: 'Update', onPressed: () {}),
      ),
      body: ListView(
        padding: Utils.symmetric(),

        children: [
          Utils.verticalSpace(16.0),
          CustomForm(
            label: 'Current Password',
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Current Password',
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
          Utils.verticalSpace(16.0),
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
