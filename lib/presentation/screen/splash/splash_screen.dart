import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.onBoardingScreen, (route) => false,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: _splashWidget());
  }

  Widget _splashWidget() {
    return Padding(
      padding: Utils.symmetric(h: 24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomImage(
                path: KImages.splashCircleOne,
                fit: BoxFit.cover,
                height: 249,
                width: 249,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(path: KImages.splashIcon),
                Utils.horizontalSpace(6),
                CustomText(
                  text: 'ConsCom',
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomImage(
                path: KImages.splashCircleTwo,
                fit: BoxFit.cover,
                height: 249,
                width: 249,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
