import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layer_complain/widgets/primary_button.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_text.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> status = ['All', 'Active', 'Resolve', 'Pending'];
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
          _buildChips(categories, selectedCategoryIndexes, (index) {}),
          Utils.verticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: Utils.symmetric(v: 8.0, h: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: inputFillBorderColor),
                ),
                child: CustomText(text: 'Clear Filter'),
              ),
              Container(
                padding: Utils.symmetric(v: 8.0, h: 50.0),
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
