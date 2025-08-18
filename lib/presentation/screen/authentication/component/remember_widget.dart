import 'package:flutter/material.dart';

import '../../../../routes/route_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class RememberWidget extends StatelessWidget {
  const RememberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: Utils.only(right: 8.0),
              height: Utils.vSize(24.0),
              width: Utils.hSize(24.0),
              child: Checkbox(
                onChanged: (value) {},
                value: false,
                activeColor: primaryColor,
              ),
            ),
            const CustomText(text: 'Remember me', fontSize: 16.0),
          ],
        ),
        GestureDetector(
          onTap:
              () =>
                  Navigator.pushNamed(context, RouteNames.forgotPasswordScreen),
          child: const CustomText(text: 'Forgot Password'),
        ),
      ],
    );
  }
}
