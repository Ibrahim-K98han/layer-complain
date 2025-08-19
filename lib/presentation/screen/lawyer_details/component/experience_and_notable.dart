import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../widgets/custom_text.dart';

class ExperienceAndNotable extends StatelessWidget {
  const ExperienceAndNotable({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        title: CustomText(
          text: 'Experience & Notable Cases',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        children: [
          CustomText(
            textAlign: TextAlign.justify,
            text:
                'John Smith is a seasoned attorney with over 15 years of experience in consumer rights law, business disputes, and contract law. He has successfully represented clients in numerous high-profile cases. John graduated with honors from Harvard Law School and has been a member of the California State Bar since 2005. He is passionate about ensuring.',
          ),
        ],
      ),
    );
  }
}
