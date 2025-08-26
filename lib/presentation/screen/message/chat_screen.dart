import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';

import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Florancio Dorrance', visibleLeading: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: const [
                ChatBubble(
                  isSender: false,
                  message:
                      "Hello, Jr Sam! Is your AC system winter-ready?\nOur Winter AC Master Cleaning and Servicing package ensures.",
                  time: "09:00 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message:
                      "Good morning. Yes, now I’m working on freelance projects",
                  time: "09:10 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: true,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
                ChatBubble(
                  isSender: false,
                  message: "Great! Can you send us your portfolio?",
                  time: "09:30 AM",
                ),
              ],
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;
  final List<String>? attachments;

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
    this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
        isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = isSender ? primaryColor : inputFillBorderColor;
    final textColo = isSender ? whiteColor : textColor;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
      bottomLeft: Radius.circular(isSender ? 8 : 0),
      bottomRight: Radius.circular(isSender ? 0 : 8),
    );

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(color: bgColor, borderRadius: radius),
          child: CustomText(text: message, color: textColo),
        ),
        if (attachments != null && attachments!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                CustomText(text: "Attachment", fontSize: 12),
                const SizedBox(height: 4),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: attachments!.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            attachments![index],
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        CustomText(text: '$time', fontSize: 10, color: hintTextColor),

        SizedBox(height: 4),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: Utils.symmetric(h: 14.0, v: 14.0),
                  fillColor: whiteColor,
                  hintText: 'Write a Message ...',
                  hintStyle: TextStyle(color: hintTextColor),
                  prefixIcon: IconButton(
                    icon: CustomImage(path: KImages.smileImogeIcon),
                    onPressed: () {},
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CustomImage(
                            path: KImages.linkIcon,
                            color: hintTextColor,
                          ),
                        ),
                        Utils.horizontalSpace(8),
                        GestureDetector(
                          onTap: () {},
                          child: CustomImage(
                            path: KImages.camersIcon,
                            color: hintTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Utils.horizontalSpace(10),
            Container(
              padding: Utils.all(value: 10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: CustomImage(path: KImages.sentIcon),
            ),
          ],
        ),
      ),
    );
  }
}
