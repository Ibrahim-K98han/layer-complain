import 'package:flutter/material.dart';
import '../utils/constraints.dart';
import '../utils/k_images.dart';
import '../utils/utils.dart';
import 'custom_image.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.onTap,
    this.horSpace = 20.0,
    this.bgColor = whiteColor,
    this.textColo = textColor,
    this.iconColo = textColor,
    this.visibleLeading = true,
    this.iconBgColor = primaryColor,
    this.action = const [],
    this.titleCenter = false,
  });

  final String title;
  final double horSpace;
  final Color bgColor;
  final Color textColo;
  final Color iconColo;
  final bool visibleLeading;
  final bool titleCenter;
  final Color iconBgColor;
  final Function()? onTap;
  final List<Widget> action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: titleCenter,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (visibleLeading)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                // height: 48.w,
                // width: 48.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomImage(path: KImages.arrowLeftIcon),
              ),
            ),
          Utils.horizontalSpace(horSpace),
          CustomText(
            textAlign: TextAlign.center,
            text: title,
            fontSize: 18.0,
            fontFamily: bold700,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ],
      ),
      actions: action,
      toolbarHeight: Utils.vSize(70.0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Utils.vSize(60.0));
}
