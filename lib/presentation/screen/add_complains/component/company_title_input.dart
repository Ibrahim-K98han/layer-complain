import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class CompanyTitleInput extends StatelessWidget {
  const CompanyTitleInput({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Utils.verticalSpace(12),
        Row(
          children: [
            CustomText(
              text: 'Complaint Title',
              fontSize: 14,
              color: lightTextColor,
            ),

            CustomText(
              text: ' (Max 150 Characters)',
              fontSize: 12,
              color: hintTextColor,
            ),
          ],
        ),
        Utils.verticalSpace(4),
        widget ?? SizedBox.shrink(),
        Utils.verticalSpace(12),
      ],
    );
  }
}
