
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.verticalSpace(16),
        CustomText(text: 'Summary', fontSize: 16, fontWeight: FontWeight.w500),
        ReadMoreText(
          Utils.htmlTextConverter(
            'Sed ut perspiciatis undesi omnis iste our natus error sit voluptatem sheis accusantium dolo laudansitium as thl totam remlas our aperiam, avolup aspernatur aut as odit aut fugit, Send quia as hay consequuntur magni dolores as eos quias ratione voluptatemals as our sesqui nesciunt.',
          ),
          trimLength: 195,
          trimCollapsedText: 'See More',
          moreStyle: const TextStyle(
            fontSize: 12,
            color: primaryColor,
            height: 1.6,
          ),
          lessStyle: const TextStyle(
            fontSize: 12,
            color: primaryColor,
            height: 1.6,
          ),
          style: const TextStyle(fontSize: 12.0, color: textColor),
        ),
      ],
    );
  }
}
