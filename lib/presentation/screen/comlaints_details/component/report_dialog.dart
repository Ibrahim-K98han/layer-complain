import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layer_complain/presentation/screen/comlaints_details/component/report_tile.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class ReportDialog {
  static Future<void> show(BuildContext context) async {
    String? selected;
    final reasons = [
      "Unwanted commercial content, spam, or scams",
      "Hate speech",
      "Copyright infringement",
      "Sharing someone else's personal information",
      "False or misleading not based on a real experience",
      "Harassment or bullying",
      "Sexually explicit or inappropriate content",
      "Complaint submitted for the wrong business",
    ];
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            titlePadding: EdgeInsets.symmetric(horizontal: 8.0),
            backgroundColor: whiteColor,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Report this complaint",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.close, size: 20, color: primaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Utils.horizontalLine(),
              ],
            ),
            content: StatefulBuilder(
              builder:
                  (context, setState) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Please refer to our ",
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              color: textColor,
                            ),
                            children: [
                              TextSpan(
                                text: "Consumer FAQ",
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: textColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: textColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Business FAQ",
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: textColor,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "for information. Choose a reason why you want to report this complain",
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Column(
                          children:
                              reasons.map((reason) {
                                return ReportTile(
                                  text: reason,
                                  isSelected: selected == reason,
                                  onTap: () {
                                    setState(() => selected = reason);
                                  },
                                );
                              }).toList(),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: Utils.symmetric(h: 8.0, v: 8.0),
                          decoration: BoxDecoration(
                            color: inputFillColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: CustomText(
                            textAlign: TextAlign.left,
                            text:
                                "Don’t use this form to edit your complaint or remove attachments. Instead, follow instructions and contact support@conscom.com",
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          maxLines: 2,
                          decoration: const InputDecoration(
                            hintText:
                                'What exactly is wrong with this complaint?',
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: Utils.symmetric(h: 30.0, v: 14.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: inputFillBorderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: CustomText(text: 'Cancel'),
                                  ),
                                ),
                              ),
                            ),
                            Utils.horizontalSpace(8.0),
                            Expanded(
                              child: Container(
                                padding: Utils.symmetric(h: 30.0, v: 14.0),
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'Report',
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
            ),
          ),
    );
  }
}
