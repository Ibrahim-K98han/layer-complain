import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class MyComplaintsContainer extends StatelessWidget {
  const MyComplaintsContainer({super.key});

  void _showPopupMenu(BuildContext context, Offset tapPosition) {
    showMenu(
      color: whiteColor,
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx - 150,
        tapPosition.dy,
        tapPosition.dx,
        tapPosition.dy + 1,
      ),
      items: [
        PopupMenuItem(
          value: 'edit',
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.addComplainsScreen);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(path: KImages.editIcon, color: textColor),
                SizedBox(width: 8),
                CustomText(text: 'Edit Complaint'),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'schedule',
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                backgroundColor: whiteColor,
                constraints: BoxConstraints.loose(
                  Size(
                    Utils.mediaQuery(context).width,
                    Utils.mediaQuery(context).height * 0.3,
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
                          child: ScheduleBottomSheetAllLawyer(),
                        );
                      },
                    ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(path: KImages.scheduleRemoveIcon),
                SizedBox(width: 8),
                CustomText(text: 'Schedule Remove(\$5)'),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          value: 'immediate',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImage(path: KImages.immediateRemoveIcon),
              SizedBox(width: 8),
              CustomText(text: 'Immediate Remove(\$12)'),
            ],
          ),
        ),
      ],
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ).then((value) {
      if (value != null) {
        switch (value) {
          case 'edit':
            // Handle edit complaint
            print('Edit complaint selected');
            // Add your edit logic here
            break;
          case 'schedule':
            // Handle schedule remove
            print('Schedule remove selected');
            // Add your schedule logic here
            break;
          case 'immediate':
            // Handle immediate remove
            print('Immediate remove selected');
            // Add your immediate remove logic here
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Utils.only(bottom: 12.0),
      padding: Utils.symmetric(h: 12.0, v: 8.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: '#14545'),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  _showPopupMenu(context, details.globalPosition);
                },
                child: Container(
                  padding: Utils.symmetric(h: 8.0, v: 2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: inputFillBorderColor),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12),
          CustomText(
            text: 'Defective Product from Retailer',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(4.0),
          Row(
            children: [
              Container(
                padding: Utils.symmetric(h: 8.0, v: 6.0),
                decoration: BoxDecoration(
                  color: greenLightColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImage(
                      path: KImages.resolveIcon,
                      color: greenColor,
                      width: 12.w,
                      height: 12.h,
                      fit: BoxFit.cover,
                    ),
                    Utils.horizontalSpace(4.0),
                    CustomText(
                      text: 'Resolved',
                      color: greenColor,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              Utils.horizontalSpace(12),
              CustomText(text: '01/15/2023', color: lightTextColor),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleBottomSheetAllLawyer extends StatefulWidget {
  const ScheduleBottomSheetAllLawyer({super.key});

  @override
  State<ScheduleBottomSheetAllLawyer> createState() =>
      _ScheduleBottomSheetAllLawyerState();
}

class _ScheduleBottomSheetAllLawyerState
    extends State<ScheduleBottomSheetAllLawyer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: 'Are you Sure Schedule\nRemove your Complaint',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: Utils.symmetric(v: 12.0, h: 60.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: inputFillBorderColor),
                ),
                child: CustomText(text: 'Cancel'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.paymentScreen);
                },
                child: Container(
                  padding: Utils.symmetric(v: 12.0, h: 60.0),
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: CustomText(text: 'Yes', color: whiteColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
