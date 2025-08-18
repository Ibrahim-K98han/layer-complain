import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/subscription/component/build_feature_item.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedGateway = -1;

  // Payment gateway data
  final List<Map<String, String>> paymentGateways = [
    {'name': 'PayPal', 'image': KImages.paypal},
    {'name': 'Stripe', 'image': KImages.strip},
  ];
  final List<Map<String, dynamic>> features = [
    {'text': 'Legal Assistance', 'isIncluded': true},
    {'text': 'Unlimited Complaints', 'isIncluded': true},
    {'text': '24/7 Support', 'isIncluded': true},
    {'text': 'Response Time Priority', 'isIncluded': true},
    {'text': 'Complaint Tracking', 'isIncluded': true},
    {'text': 'Customer Support', 'isIncluded': true},
    {'text': 'Customizable Alerts', 'isIncluded': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: scaffoldColor, title: 'Payment'),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: 'Selected Package',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomImage(
                      path: KImages.exchangeIcon,
                      width: 16.w,
                      height: 16.h,
                      fit: BoxFit.cover,
                    ),
                    Utils.horizontalSpace(4),
                    CustomText(
                      text: 'Change',
                      color: greenColor,
                      decoration: TextDecoration.underline,
                      underLineColor: greenColor,
                    ),
                  ],
                ),
              ],
            ),
            Utils.verticalSpace(16),
            Container(
              padding: Utils.symmetric(h: 12.0, v: 8.0),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Business Plan',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: '\$99.00',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Utils.verticalSpace(12),
                  Utils.horizontalLine(),
                  Utils.verticalSpace(8),
                  Column(
                    children:
                        features
                            .map(
                              (feature) => BuildFeatureItem(
                                text: feature['text'],
                                isIncluded: feature['isIncluded'],
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
            Utils.verticalSpace(24),
            CustomText(
              text: 'Choose Payment Options',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(16),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                itemCount: paymentGateways.length,
                itemBuilder: (context, index) {
                  return PaymentGatewayTile(
                    imagePath: paymentGateways[index]['image']!,
                    isSelected: selectedGateway == index,
                    onTap: () {
                      setState(() {
                        selectedGateway = index;
                      });
                    },
                  );
                },
              ),
            ),
            Utils.verticalSpace(20),
            Padding(
              padding: Utils.symmetric(h: 60),
              child: PrimaryButton(text: 'Payment Now', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentGatewayTile extends StatelessWidget {
  const PaymentGatewayTile({
    super.key,

    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Utils.symmetric(v: 14.0),
        margin: Utils.only(bottom: 10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(path: imagePath, width: 100.w, height: 30.h),
            Utils.horizontalSpace(8),
            isSelected
                ? CustomImage(
                  path: KImages.rightMarkIcon,
                  width: 20.w,
                  height: 20.h,
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
