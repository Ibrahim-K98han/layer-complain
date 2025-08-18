import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_image.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Utils.verticalSpace(20),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShowBanner();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShowBanner extends StatelessWidget {
  const ShowBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: CustomImage(
          path: KImages.banners,
          width: 290.w,
          height: 100.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
