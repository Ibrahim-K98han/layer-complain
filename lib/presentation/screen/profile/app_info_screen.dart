import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'App Info'),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            CustomText(
              text:
                  'ConsCom is a citizen-first platform built to simplify the way consumer complaints are submitted, tracked, & resolved — transparently and efficiently.',
              color: lightTextColor,
            ),
            Utils.verticalSpace(24),
            CustomText(text: 'Legal & Privacy:', fontWeight: FontWeight.w500),
            Utils.verticalSpace(8),
            CustomText(text: 'Terms of Service'),
            CustomText(text: 'Privacy Policy'),
            Utils.verticalSpace(24),
            Row(
              children: [
                CustomText(text: 'App Version: '),
                CustomText(text: 'v1.0.0', fontWeight: FontWeight.w500),
              ],
            ),
            Utils.verticalSpace(8),
            Row(
              children: [
                CustomText(text: 'Build Date: '),
                CustomText(text: 'June 2025', fontWeight: FontWeight.w500),
              ],
            ),
            Utils.verticalSpace(24),
            CustomText(text: 'Support Contact:', fontWeight: FontWeight.w500),
            Utils.verticalSpace(8),
            Row(
              children: [
                CustomText(text: 'Email: '),
                CustomText(
                  text: 'support@conscom.app',
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Utils.verticalSpace(8),
            Row(
              children: [
                CustomText(text: 'Phone: '),
                CustomText(text: '+123 456 7890', fontWeight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
