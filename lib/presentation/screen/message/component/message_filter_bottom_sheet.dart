import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';

import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class MessageFilterBottomSheet extends StatefulWidget {
  const MessageFilterBottomSheet({super.key});

  @override
  State<MessageFilterBottomSheet> createState() =>
      _MessageFilterBottomSheetState();
}

class _MessageFilterBottomSheetState extends State<MessageFilterBottomSheet> {
  String selectedFilter = 'All messages';
  final List<String> filters = ['All messages', 'Unread messages'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Filter',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImage(
                  path: KImages.closeIcon,
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(14),
          Utils.horizontalLine(),
          Utils.verticalSpace(14),
          ...filters.map((filter) {
            bool isSelected = selectedFilter == filter;
            return Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 8.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: filter, fontSize: 18),
                        _buildRadioCircle(isSelected),
                      ],
                    ),
                  ),
                ),
                Utils.verticalSpace(16),
                Utils.horizontalLine(),
                Utils.verticalSpace(16),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRadioCircle(bool isSelected) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? primaryColor : lightTextColor),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ),
    );
  }
}
