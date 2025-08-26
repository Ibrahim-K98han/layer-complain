import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/comlaints_details/component/report_tile.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';

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
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            // transparent to use custom shape
            insetPadding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Row
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

                  // Scrollable Content
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Please refer to our ",
                            style: TextStyle(fontSize: 12, color: textColor),
                            children: [
                              TextSpan(
                                text: "Consumer FAQ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: textColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Business FAQ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: textColor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " for information. Choose a reason why you want to report this complaint.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),

                        // Report options
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
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
                            );
                          },
                        ),

                        SizedBox(height: 8),
                        Container(
                          padding: Utils.symmetric(h: 8.0, v: 8.0),
                          decoration: BoxDecoration(
                            color: inputFillColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            "Don’t use this form to edit your complaint or remove attachments. Instead, follow instructions and contact support@conscom.com",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 12),

                        // TextFormField
                        TextFormField(
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText:
                                'What exactly is wrong with this complaint?',
                          ),
                        ),
                        SizedBox(height: 12),

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: Utils.symmetric(h: 30.0, v: 14.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: inputFillBorderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(child: Text('Cancel')),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Container(
                                padding: Utils.symmetric(h: 30.0, v: 14.0),
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Report',
                                    style: TextStyle(color: whiteColor),
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
                ],
              ),
            ),
          ),
    );
  }
}
