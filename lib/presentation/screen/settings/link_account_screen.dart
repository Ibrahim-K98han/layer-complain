import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class LinkAccountScreen extends StatefulWidget {
  const LinkAccountScreen({super.key});

  @override
  State<LinkAccountScreen> createState() => _LinkAccountScreenState();
}

class _LinkAccountScreenState extends State<LinkAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Link Account'),
      body: ListView(
        padding: Utils.symmetric(),
        children:
            List.generate(5, (index) {
              return LinkAccountContainer();
            }).toList(),
      ),
    );
  }
}

class LinkAccountContainer extends StatelessWidget {
  const LinkAccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Utils.only(bottom: 13),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF1F2F4)),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: ListTile(
        contentPadding: Utils.symmetric(h: 12.0, v: 4.0),
        leading: Container(
          padding: Utils.all(value: 6.r),
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: CustomImage(path: KImages.googleIcon),
        ),
        title: CustomText(
          text: 'Google',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: 'Not Connected', fontSize: 11),
            Utils.horizontalSpace(4),
            Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }
}
