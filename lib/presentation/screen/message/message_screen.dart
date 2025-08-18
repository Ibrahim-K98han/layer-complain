import 'package:flutter/material.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: 'Message'),),
    );
  }
}
