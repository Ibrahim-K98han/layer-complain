import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';

import '../../../utils/utils.dart';
import 'component/switch_widget.dart';

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

