import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import '../../../widgets/custom_form.dart';
import 'component/popular_question_widget.dart';

class SupportTicketScreen extends StatefulWidget {
  const SupportTicketScreen({super.key});

  @override
  State<SupportTicketScreen> createState() => _SupportTicketScreenState();
}

class _SupportTicketScreenState extends State<SupportTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Support Ticket'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottom-right
      floatingActionButton: SpeedDial(
        // Main FAB
        icon: Icons.add,
        activeIcon: Icons.close,
        // show X when open
        backgroundColor: primaryColor,
        // red background
        foregroundColor: whiteColor,
        // white icon
        shape: const CircleBorder(),
        elevation: 0,
        direction: SpeedDialDirection.up,
        // expand LEFT
        spaceBetweenChildren: 12,
        closeDialOnPop: true,
        childrenButtonSize: const Size(170, 50),
        // wide buttons
        children: [
          SpeedDialChild(
            backgroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // pill shape
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(path: KImages.previousTicketIcon),
                const SizedBox(width: 8),
                CustomText(
                  text: 'Previous Ticket',
                  color: Colors.black,
                  fontSize: 14,
                ),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                backgroundColor: whiteColor,
                constraints: BoxConstraints.loose(
                  Size(
                    Utils.mediaQuery(context).width,
                    Utils.mediaQuery(context).height * 0.8,
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
                          child: SupportTicketFilterBottomSheet(),
                        );
                      },
                    ),
              );
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // pill shape
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(path: KImages.openNowIcon),
                const SizedBox(width: 8),
                CustomText(text: 'Open New', color: Colors.black, fontSize: 14),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),

      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            Container(
              padding: Utils.symmetric(h: 0.0, v: 16.0),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                children: [
                  CustomText(
                    text: 'How Can We Help you?',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: 'Type your question or search keywords',
                    fontSize: 12,
                    color: lightTextColor,
                  ),
                  Utils.verticalSpace(16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: Utils.all(value: 8.r),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: CustomImage(path: KImages.emailIcon),
                      ),
                      Utils.horizontalSpace(8),
                      Container(
                        padding: Utils.all(value: 8.r),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: CustomImage(
                          path: KImages.callIcon,
                          color: primaryColor,
                        ),
                      ),
                      Utils.horizontalSpace(8),
                      Container(
                        padding: Utils.all(value: 8.r),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: CustomImage(path: KImages.browsingIcon),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Popular Question',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            Utils.verticalSpace(12),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return PopularQuestionWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SupportTicketFilterBottomSheet extends StatefulWidget {
  const SupportTicketFilterBottomSheet({super.key});

  @override
  State<SupportTicketFilterBottomSheet> createState() =>
      _SupportTicketFilterBottomSheetState();
}

class _SupportTicketFilterBottomSheetState
    extends State<SupportTicketFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Support Ticket',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(16),
          Utils.horizontalLine(),
          Utils.verticalSpace(16),
          CustomForm(
            label: 'Subject',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'subject'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Utils.verticalSpace(12),
          CustomForm(
            label: 'Description',
            child: TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'description'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Utils.verticalSpace(12),
          Row(
            children: [
              DottedBorder(
                color: hintTextColor,
                strokeWidth: 1,
                dashPattern: [2, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(6),
                padding: Utils.symmetric(h: 12.0, v: 8.0),
                child: Row(
                  children: [
                    CustomImage(path: KImages.addFileIcon),
                    Utils.horizontalSpace(8),
                    CustomText(
                      text: 'Choose File',
                      decoration: TextDecoration.underline,
                      color: textColor,
                    ),
                  ],
                ),
              ),
              Utils.horizontalSpace(12),
              CustomText(text: 'ScreenShot.jpg', color: textColor),
            ],
          ),
          Utils.verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: Utils.symmetric(h: 12.0, v: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(),
                  ),
                  child: Center(
                    child: CustomText(text: 'Cancel', fontSize: 16),
                  ),
                ),
              ),
              Utils.horizontalSpace(12),
              Expanded(
                child: Container(
                  padding: Utils.symmetric(h: 12.0, v: 12.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Submit',
                      color: whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
