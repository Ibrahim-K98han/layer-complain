import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/primary_button.dart';

class MessageBottomSheet extends StatefulWidget {
  const MessageBottomSheet({super.key});

  @override
  State<MessageBottomSheet> createState() => _MessageBottomSheetState();
}

class _MessageBottomSheetState extends State<MessageBottomSheet> {
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
                text: 'Drop Message',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomImage(
                  path: KImages.closeIcon,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Utils.horizontalLine(),
          Utils.verticalSpace(16),
          CustomForm(
            label: 'Full Name',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'full name'),
            ),
          ),
          Utils.verticalSpace(8),
          CustomText(text: 'Phone Number', fontSize: 14),
          Utils.verticalSpace(4.0),
          IntlPhoneField(
            initialCountryCode: 'BD',
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
            ),
            flagsButtonPadding: const EdgeInsets.all(4),
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Email Address',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'email address'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Subject',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'Subject'),
            ),
          ),
          Utils.verticalSpace(8),
          CustomForm(
            label: 'Message',
            child: TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'Message'),
            ),
          ),
          Utils.verticalSpace(16),
          PrimaryButton(
            bgColor: textColor,
            text: 'Send Message',
            onPressed: () {},
          ),
          Utils.verticalSpace(16),
        ],
      ),
    );
  }
}
