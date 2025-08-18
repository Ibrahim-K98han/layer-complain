import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';
import 'package:layer_complain/widgets/primary_button.dart';

import 'component/build_feature_item.dart';
import 'component/build_plan_card.dart';
import 'component/month_and_year_btn.dart';

class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({super.key});

  @override
  State<SubScriptionScreen> createState() => _SubScriptionScreenState();
}

class _SubScriptionScreenState extends State<SubScriptionScreen> {
  String selectedPlan = 'Pro Plan';
  bool isShowFeature = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(bgColor: scaffoldColor, title: 'Get Subscription'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: 'Subscribe to ConsCom',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text:
                  'Subscription Plan layout for the Consumer Complaint Resolution Platform',
              color: lightTextColor,
            ),
            Utils.verticalSpace(16),

            ///============ Month And Year Button ========///
            MonthAndYearBtn(),
            Utils.verticalSpace(30),
            BuildPanCar(
              title: 'Basics Plan',
              price: '\$9.99',
              subtitle: 'Perfect for quick response or downgrade quickly',
              color: Colors.blue,
              icon: KImages.basicIcon,
              textColor: blueColor,
              isPopular: false,
              isSelected: selectedPlan == 'Basics Plan',
              onTap: () {
                setState(() {
                  selectedPlan = 'Basics Plan';
                });
              },
            ),
            Utils.verticalSpace(15),

            BuildPanCar(
              title: 'Pro Plan',
              price: '\$29.99',
              subtitle: 'Can fast response or downgrade quickly',
              color: Colors.purple,
              icon: KImages.proIcon,
              textColor: purpleColor,
              isPopular: true,
              isSelected: selectedPlan == 'Pro Plan',
              onTap: () {
                setState(() {
                  selectedPlan = 'Pro Plan';
                });
              },
            ),
            Utils.verticalSpace(15),

            BuildPanCar(
              title: 'Business Plan',
              price: '\$99.99',
              subtitle: 'Perfect for quick response or downgrade quickly',
              color: Colors.green,
              icon: KImages.businessIcon,
              textColor: greenColor,
              isPopular: false,
              isSelected: selectedPlan == 'Business Plan',
              onTap: () {
                setState(() {
                  selectedPlan = 'Business Plan';
                });
              },
            ),
            Utils.verticalSpace(20),
            Padding(
              padding: Utils.symmetric(h: 50.0),
              child: PrimaryButton(
                text: 'Get Subscription',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.paymentScreen);
                },
              ),
            ),
            Utils.verticalSpace(15),

            ((isShowFeature == true && selectedPlan == 'Business Plan') ||
                    selectedPlan == 'Pro Plan')
                ? Container(
                  padding: Utils.all(value: 4.r),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildFeatureItem(
                        text: 'Legal Assistance',
                        isIncluded: true,
                      ),
                      BuildFeatureItem(text: '2 Complaints', isIncluded: true),
                      BuildFeatureItem(text: '24/7 Support', isIncluded: true),
                      BuildFeatureItem(
                        text: 'Response Time Priority',
                        isIncluded: true,
                      ),
                      BuildFeatureItem(
                        text: 'Complaint Tracking',
                        isIncluded: true,
                      ),
                      BuildFeatureItem(
                        text: 'Customer Support',
                        isIncluded: false,
                      ),
                      BuildFeatureItem(
                        text: 'Customizable Alerts',
                        isIncluded: false,
                      ),
                    ],
                  ),
                )
                : SizedBox.shrink(),
            Utils.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
