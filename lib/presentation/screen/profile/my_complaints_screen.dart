import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/routes/route_names.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/custom_text.dart';

import 'component/my_complaints_container.dart';

class MyComplaintsScreen extends StatefulWidget {
  const MyComplaintsScreen({super.key});

  @override
  State<MyComplaintsScreen> createState() => _MyComplaintsScreenState();
}

class _MyComplaintsScreenState extends State<MyComplaintsScreen> {
  String? selectedValue1; // Renamed for first dropdown
  String? selectedValue2; // Added for second dropdown
  final List<String> items = ['2-5 years', '5-10 years'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: CustomAppBar(
        bgColor: scaffoldColor,
        title: 'My Complaints',
        titleCenter: true,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.addComplainsScreen);
              },
              child: Row(
                children: [
                  CustomImage(path: KImages.addFileIcon),
                  Utils.horizontalSpace(4),
                  CustomText(text: 'Add'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: Utils.symmetric(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedValue1,
                    // Use first dropdown value
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: hintTextColor,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: hintTextColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(color: lightTextColor, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    hint: CustomText(text: '2-5 years', color: hintTextColor),
                    items:
                        items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue1 = newValue; // Update first dropdown
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
                Utils.horizontalSpace(12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedValue2,
                    // Use second dropdown value
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: hintTextColor,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(
                          color: hintTextColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: BorderSide(color: lightTextColor, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    hint: CustomText(text: '2-5 years', color: hintTextColor),
                    items:
                        items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue2 = newValue; // Update second dropdown
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyComplaintsContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


