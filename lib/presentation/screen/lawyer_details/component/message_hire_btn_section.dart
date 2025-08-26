import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import 'hire_bottom_sheet.dart';
import 'message_bottom_sheet.dart';

class MessageHireBtnSection extends StatelessWidget {
  const MessageHireBtnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 16.0, v: 8.0),
      height: 100.h,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: whiteColor,
                  constraints: BoxConstraints.loose(
                    Size(
                      Utils.mediaQuery(context).width,
                      Utils.mediaQuery(context).height * 0.9,
                    ),
                  ),
                  isScrollControlled: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Utils.radius(20.0)),
                      topRight: Radius.circular(Utils.radius(20.0)),
                    ),
                  ),
                  builder:
                      (context) => DraggableScrollableSheet(
                        initialChildSize: 0.85,
                        minChildSize: 0.5,
                        maxChildSize: 0.95,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: MessageBottomSheet(),
                          );
                        },
                      ),
                );
              },
              child: Container(
                padding: Utils.symmetric(v: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: hintTextColor),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    CustomImage(path: KImages.messageDubleIcon),
                    Utils.horizontalSpace(12.0),
                    CustomText(text: 'Message'),
                  ],
                ),
              ),
            ),
          ),
          Utils.horizontalSpace(16.0),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: whiteColor,
                  constraints: BoxConstraints.loose(
                    Size(
                      Utils.mediaQuery(context).width,
                      Utils.mediaQuery(context).height * 0.9,
                    ),
                  ),
                  isScrollControlled: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Utils.radius(20.0)),
                      topRight: Radius.circular(Utils.radius(20.0)),
                    ),
                  ),
                  builder:
                      (context) => DraggableScrollableSheet(
                        initialChildSize: 0.85,
                        minChildSize: 0.5,
                        maxChildSize: 0.95,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: HireBottomSheet(),
                          );
                        },
                      ),
                );
              },
              child: Container(
                padding: Utils.symmetric(v: 10.0),
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    CustomImage(path: KImages.hireIcon),
                    Utils.horizontalSpace(12.0),
                    CustomText(text: 'Hire now', color: whiteColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
