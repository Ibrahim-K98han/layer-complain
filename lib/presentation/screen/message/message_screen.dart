import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import '../../../routes/route_names.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import 'component/message_filter_bottom_sheet.dart';
import 'component/message_section.dart';

class MessageScreen extends StatefulWidget {
  final bool showBack;

  const MessageScreen({super.key, this.showBack = false});

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
        visibleLeading: widget.showBack,
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
