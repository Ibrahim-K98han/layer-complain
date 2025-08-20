import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constraints.dart';

class AgreeWidget extends StatelessWidget {
  const AgreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: primaryColor,
          value: true,
          onChanged: (value) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'I am agree with company ',
              style: GoogleFonts.dmSans(fontSize: 14, color: hintTextColor),
              children: [
                TextSpan(
                  text: 'Term of Service',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: hintTextColor,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
