import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:layer_complain/presentation/screen/add_complains/component/terms_and_agree.dart';
import 'package:layer_complain/routes/route_names.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/primary_button.dart';
import 'add_image_section.dart';
import 'company_description_input.dart';
import 'company_title_input.dart';

class AddComplaintDataWidget extends StatelessWidget {
  const AddComplaintDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomForm(
          label: 'Name of Company',
          child: TextFormField(
            decoration: const InputDecoration(hintText: 'Name of Company'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Utils.verticalSpace(12),
        CustomForm(
          label: 'Email Address',
          child: TextFormField(
            decoration: const InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Utils.verticalSpace(12),
        CustomText(text: 'Phone Number', fontSize: 14,color: lightTextColor,),
        Utils.verticalSpace(4),
        IntlPhoneField(
          initialCountryCode: 'BD',
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          ),
          flagsButtonPadding: const EdgeInsets.all(4),
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),

        ///========= Company Title input ======///
        CompanyTitleInput(
          widget: TextFormField(
            decoration: const InputDecoration(hintText: 'Complaint Title',),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomForm(
                label: 'Category',
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'E-commerce'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Utils.horizontalSpace(12),
            Expanded(
              child: CustomForm(
                label: 'Sub-Category',
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'E-commerce'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ],
        ),

        ///========= Company Details input ======///
        CompanyDescriptionInput(
          widget: TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(hintText: 'Complaint Title'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),

        ///========= Add Image Section ======///

        AddImageSection(),

        CustomForm(
          label: 'Short Note',
          child: TextFormField(
            decoration: const InputDecoration(hintText: 'short not'),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Utils.verticalSpace(12),

        ///========= Terms And Agree Section ======///
        TermsAndAgree(),
        Utils.verticalSpace(20),
        PrimaryButton(
          bgColor: textColor,
          text: 'Submit now',
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.subscriptionScreen);
          },
        ),
        Utils.verticalSpace(20),
      ],
    );
  }
}
