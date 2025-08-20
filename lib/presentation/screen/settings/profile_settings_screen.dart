import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/circle_image.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';
import 'package:layer_complain/widgets/primary_button.dart';
import '../../../widgets/custom_form.dart';
import '../../../widgets/custom_text.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String? selectedCountryValue;
  String? selectedCityValue;
  String? selectedStateValue;

  final List<String> countryValue = ['Bangladesh', 'Pakistan', 'Afghanistan'];
  final List<String> cityValue = ['Dhaka', 'Khulna', 'Rajshahi'];
  final List<String> stateValue = ['Mirpur', 'Jatrabari', 'Gulshan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Profile Settings'),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Image with Camera Icon
              Stack(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    padding: Utils.all(value: 1.r),
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleImage(image: KImages.person),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: Utils.all(value: 4),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: CustomImage(
                        path: KImages.camersIcon,
                        color: whiteColor,
                        width: 14.w,
                        height: 14.h,
                      ),
                    ),
                  ),
                ],
              ),

              Utils.verticalSpace(20),

              // Name Fields
              Row(
                children: [
                  Expanded(
                    child: ProfileTextField(
                      label: "First Name",
                      hintText: "First Name",
                    ),
                  ),
                  Utils.horizontalSpace(12),
                  Expanded(
                    child: ProfileTextField(
                      label: "Last Name",
                      hintText: "Last Name",
                    ),
                  ),
                ],
              ),

              Utils.verticalSpace(12),
              ProfileTextField(
                label: "Email Address",
                hintText: "email",
                inputType: TextInputType.emailAddress,
              ),

              Utils.verticalSpace(12),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text: 'Phone Number', fontSize: 14),
              ),
              Utils.verticalSpace(4),
              IntlPhoneField(
                initialCountryCode: 'BD',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                flagsButtonPadding: const EdgeInsets.all(4),
                onChanged: (phone) => print(phone.completeNumber),
              ),

              Utils.verticalSpace(12),

              // Country & City
              Row(
                children: [
                  Expanded(
                    child: ProfileDropdownField(
                      label: "Country",
                      hint: "Bangladesh",
                      value: selectedCountryValue,
                      items: countryValue,
                      onChanged:
                          (newValue) =>
                              setState(() => selectedCountryValue = newValue),
                    ),
                  ),
                  Utils.horizontalSpace(16),
                  Expanded(
                    child: ProfileDropdownField(
                      label: "City",
                      hint: "Dhaka",
                      value: selectedCityValue,
                      items: cityValue,
                      onChanged:
                          (newValue) =>
                              setState(() => selectedCityValue = newValue),
                    ),
                  ),
                ],
              ),

              Utils.verticalSpace(12),

              // State & Zip
              Row(
                children: [
                  Expanded(
                    child: ProfileDropdownField(
                      label: "State",
                      hint: "Mirpur",
                      value: selectedStateValue,
                      items: stateValue,
                      onChanged:
                          (newValue) =>
                              setState(() => selectedStateValue = newValue),
                    ),
                  ),
                  Utils.horizontalSpace(16),
                  Expanded(
                    child: ProfileTextField(
                      label: "Zip Code",
                      hintText: "9002",
                    ),
                  ),
                ],
              ),

              Utils.verticalSpace(12),
              ProfileTextField(label: "Address", hintText: "Address"),

              Utils.verticalSpace(20),
              PrimaryButton(text: "Save Change", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType inputType;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      label: label,
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText),
        keyboardType: inputType,
      ),
    );
  }
}

class ProfileDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const ProfileDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      label: label,
      child: DropdownButtonFormField<String>(
        dropdownColor: whiteColor,
        value: value,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        hint: CustomText(text: hint, color: hintTextColor),
        items:
            items.map((val) {
              return DropdownMenuItem<String>(
                value: val,
                child: CustomText(text: val, fontSize: 16),
              );
            }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'Please select an option' : null,
      ),
    );
  }
}
