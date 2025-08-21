import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/presentation/screen/find_lawyer/component/all_lawyer.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../utils/utils.dart';
import '../../../widgets/custom_form.dart';
import '../../../widgets/custom_text.dart';
import 'component/lawyer_container.dart';

class AllLawyerScreen extends StatefulWidget {
  const AllLawyerScreen({super.key});

  @override
  State<AllLawyerScreen> createState() => _AllLawyerScreenState();
}

class _AllLawyerScreenState extends State<AllLawyerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: scaffoldColor,
        title: 'All Lawyer',
        visibleLeading: true,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
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
                            child: FilterBottomSheetAllLawyer(),
                          );
                        },
                      ),
                );
              },
              icon: CustomImage(path: KImages.filterIcon),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: LawyerContainer(horizontalMargin: 12.0,),
          );
        },
      ),
    );
  }
}

class FilterBottomSheetAllLawyer extends StatefulWidget {
  const FilterBottomSheetAllLawyer({super.key});

  @override
  State<FilterBottomSheetAllLawyer> createState() =>
      _FilterBottomSheetAllLawyerState();
}

class _FilterBottomSheetAllLawyerState
    extends State<FilterBottomSheetAllLawyer> {
  final List<String> status = ['All', '3.5', '4.5', '5.0'];
  final List<String> categories = ['All', 'Active', 'Resolve', 'Pending'];
  String? selectedCountry;
  String? selectedCity;

  final List<String> country = ['Bangladesh', 'Pakistan'];
  final List<String> city = ['Dhaka', 'Khulna'];

  List<int> selectedCategoryIndexes = [];
  List<int> selectedStatus = [];

  Widget _buildChips(
    List<String> items,
    List<int> selectedIndexes,
    Function(int) onTap,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(items.length, (index) {
        final selected = selectedIndexes.contains(index);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (selected) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }
            });
            onTap(index);
          },
          child: Chip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: items[index],
                  fontSize: 12,
                  color: selected ? whiteColor : textColor,
                ),
                Utils.horizontalSpace(4),
                CustomImage(path: KImages.starFileIcon),
              ],
            ),
            backgroundColor: selected ? searchButtonColor : whiteColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: selected ? searchButtonColor : inputFillBorderColor,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildChipsCategory(
    List<String> items,
    List<int> selectedIndexes,
    Function(int) onTap,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(items.length, (index) {
        final selected = selectedIndexes.contains(index);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (selected) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }
            });
            onTap(index);
          },
          child: Chip(
            label: CustomText(
              text: items[index],
              fontSize: 12,
              color: selected ? whiteColor : textColor,
            ),
            backgroundColor: selected ? searchButtonColor : whiteColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: selected ? searchButtonColor : inputFillBorderColor,
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Filter by',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          Utils.verticalSpace(8),
          Utils.horizontalLine(),
          Utils.verticalSpace(8),
          Row(
            children: [
              Expanded(
                child: CustomForm(
                  label: 'Country',
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedCountry,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    hint: CustomText(text: 'Country', color: hintTextColor),
                    items:
                        country.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountry = newValue;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ),
              Utils.horizontalSpace(10.0),
              Expanded(
                child: CustomForm(
                  label: 'City',
                  child: DropdownButtonFormField<String>(
                    dropdownColor: whiteColor,
                    value: selectedCity,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    hint: CustomText(text: 'City', color: hintTextColor),
                    items:
                        city.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(text: value, fontSize: 16),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCity = newValue;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Please select an option' : null,
                  ),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(10),
          CustomText(text: 'Status', fontWeight: FontWeight.w500),
          _buildChips(status, selectedStatus, (index) {}),
          Utils.verticalSpace(10),
          CustomText(text: 'Category', fontWeight: FontWeight.w500),
          _buildChipsCategory(categories, selectedCategoryIndexes, (index) {}),
          Utils.verticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: Utils.symmetric(v: 14.0, h: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: inputFillBorderColor),
                ),
                child: CustomText(text: 'Clear Filter'),
              ),
              Container(
                padding: Utils.symmetric(v: 14.0, h: 50.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: CustomText(text: 'Show All', color: whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
