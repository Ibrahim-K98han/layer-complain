import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../widgets/custom_text.dart';

class BuildFeatureItem extends StatefulWidget {
  const BuildFeatureItem({
    super.key,
    required this.text,
    required this.isIncluded,
  });

  final String text;
  final bool isIncluded;

  @override
  State<BuildFeatureItem> createState() => _BuildFeatureItemState();
}

class _BuildFeatureItemState extends State<BuildFeatureItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: widget.isIncluded ? Colors.black : Color(0xFFF1F2F4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.isIncluded ? Icons.check : Icons.close,
              color: widget.isIncluded ? Colors.white : textColor,
              size: 14,
            ),
          ),
          SizedBox(width: 12),
          Expanded(child: CustomText(text: widget.text)),
        ],
      ),
    );
  }
}
