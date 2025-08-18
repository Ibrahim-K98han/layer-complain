import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/home/component/recent_complaint_container.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class RecentComplaintsSection extends StatelessWidget {
  const RecentComplaintsSection({
    super.key,
    this.containerWidth,
    this.title,
    this.widget,
    required this.direction,
    this.verticalMargin,
    this.horizontalMargin,
    this.scrollHeight,
  });

  final double? containerWidth;
  final double? scrollHeight;
  final String? title;
  final Widget? widget;
  final Axis direction;
  final double? verticalMargin;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            Utils.horizontalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title ?? '',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                widget ?? SizedBox.shrink(),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: scrollHeight,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: direction,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return RecentComplaintContainer(
                      containerWidth: containerWidth,
                      verticalMargin: verticalMargin,
                      horizontalMargin: horizontalMargin,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
