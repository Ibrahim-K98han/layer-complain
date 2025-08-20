import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool isToggled = false;
  double size = 30;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Notification Settings'),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            Utils.verticalSpace(16),
            SwitchWidget(
              text: 'Recommendation',
              image: KImages.likeIcon,
              subText: 'Receive recommendations based on your activities',
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SwitchWidget(
              text: 'Communication',
              image: KImages.communicationIcon,
              subText: 'Receive updates, offers and more',
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SwitchWidget(
              text: 'Promotion',
              image: KImages.promotionIcon,
              subText: 'Receive offers based on your activity',
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SwitchWidget(
              text: 'Get alert in your email',
              image: KImages.mailIcon,
              subText: 'Get updates in your email inbox',
              initialValue: true,
              onToggle: (bool value) {},
            ),
            SwitchWidget(
              text: 'Newsletter',
              image: KImages.newsIcon,
              subText: 'Receive email with cars recommendation',
              initialValue: true,
              onToggle: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    super.key,
    this.text,
    required this.initialValue,
    required this.onToggle,
    this.subText,
    this.image,
  });

  final String? text;
  final String? subText;
  final String? image;
  final bool initialValue;
  final ValueChanged<bool> onToggle;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  void _toggle() {
    setState(() => isOn = !isOn);
    widget.onToggle(isOn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: Utils.all(value: 8.r),
                decoration: BoxDecoration(
                  color: Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: CustomImage(path: widget.image),
              ),
              Utils.horizontalSpace(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.text ?? '',
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: CustomText(
                      text: widget.subText ?? '',
                      color: lightTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: _toggle,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 50,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isOn ? primaryColor : Color(0xFFEEEEEE),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 100),
                alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
