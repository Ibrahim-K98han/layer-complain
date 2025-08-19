import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/primary_button.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';
import 'component/fitler_bottom_sheet.dart';

class ComplainsScreen extends StatefulWidget {
  const ComplainsScreen({super.key});

  @override
  State<ComplainsScreen> createState() => _ComplainsScreenState();
}

class _ComplainsScreenState extends State<ComplainsScreen> {
  bool emptyData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: scaffoldColor,
        title: 'All Complaints',
        visibleLeading: false,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: whiteColor,
                  constraints: BoxConstraints.loose(
                    Size(
                      Utils.mediaQuery(context).width,
                      Utils.mediaQuery(context).height * 0.9,
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
                            child: FilterBottomSheet(),
                          );
                        },
                      ),
                );
              },
              child: CustomImage(
                path: KImages.filterIcon,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child:
            emptyData == false
                ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.verticalSpace(50),
                      CustomImage(
                        path: KImages.notFountIcon,
                        width: 80.w,
                        height: 80.h,
                        fit: BoxFit.cover,
                      ),
                      CustomText(
                        text: 'Lawyer Listing not Found Yet!',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      Utils.verticalSpace(8),
                      CustomText(
                        textAlign: TextAlign.center,
                        text:
                            'Thank you for submitting your complaint. We’ve received your details and will begin the review process shortly.',
                        fontSize: 12,
                      ),
                      Utils.verticalSpace(20),
                      Padding(
                        padding: Utils.symmetric(h: 60),
                        child: PrimaryButton(
                          bgColor: textColor,
                          fontSize: 14,
                          textColor: whiteColor,
                          text: 'Search Again',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.complaintsDetailsScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12, top: 8),
                        height: 140.h,
                        width: 335.w,
                        padding: Utils.symmetric(h: 12.0, v: 8.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  'Refund Not Processed by Super Store Electronics',
                              color: hintTextColor,
                              fontSize: 14, // 🔹 slightly smaller
                            ),
                            Utils.verticalSpace(6),
                            Row(
                              children: [
                                CustomImage(
                                  path: KImages.instaIcon,
                                  width: 20.w,
                                  height: 20.h,
                                  fit: BoxFit.cover,
                                ),
                                Utils.horizontalSpace(6),
                                CustomText(
                                  text: 'Alpha IT Com',
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Utils.verticalSpace(6),
                            Utils.horizontalLine(),
                            Utils.verticalSpace(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: 'by',
                                      color: hintTextColor,
                                      fontSize: 12,
                                    ),
                                    Utils.horizontalSpace(4),
                                    CustomText(text: 'Jonson'),
                                    Utils.horizontalSpace(4),
                                    CustomImage(
                                      path: KImages.verifyIcon,
                                      width: 12.w,
                                      height: 12.h,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 3,
                                  ), // 🔹 smaller
                                  decoration: BoxDecoration(
                                    color: yellowLightColor,
                                    borderRadius: BorderRadius.circular(50.r),
                                    border: Border.all(color: yellowColor),
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImage(
                                        path: KImages.pendingIcon,
                                        width: 10.w,
                                        height: 10.h,
                                        fit: BoxFit.cover,
                                      ),
                                      Utils.horizontalSpace(4),
                                      CustomText(
                                        text: 'Pending',
                                        fontSize: 11,
                                        color: yellowColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
