import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import '../../../routes/route_names.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import 'component/message_section.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        bgColor: whiteColor,
        title: 'Message',
        visibleLeading: false,
        action: [
          IconButton(
            onPressed: () {
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
                          child: MessageFilterBottomSheet(),
                        );
                      },
                    ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: Utils.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: Utils.symmetric(h: 14.0, v: 14.0),
                    fillColor: whiteColor,
                    hintText: 'Search Message',
                    prefixIcon: IconButton(
                      icon: CustomImage(
                        path: KImages.searchIcon,
                        color: hintTextColor,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Utils.verticalSpace(20),

                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(color: hintTextColor.withOpacity(0.2));
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MessageSection(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.chatScreen);
                      },
                      time: '04:00 PM',
                    );
                  },
                ),
                Utils.verticalSpace(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageFilterBottomSheet extends StatefulWidget {
  const MessageFilterBottomSheet({super.key});

  @override
  State<MessageFilterBottomSheet> createState() =>
      _MessageFilterBottomSheetState();
}

class _MessageFilterBottomSheetState extends State<MessageFilterBottomSheet> {
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
              CustomImage(
                path: KImages.closeIcon,
                width: 20.w,
                height: 20.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Utils.verticalSpace(16),
          Utils.horizontalLine(),
          Utils.verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'All messages', fontSize: 18),
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(16),
          Utils.horizontalLine(),
          Utils.verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Unread messages', fontSize: 18),
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
