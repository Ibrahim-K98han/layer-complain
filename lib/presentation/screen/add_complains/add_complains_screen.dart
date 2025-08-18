import 'package:flutter/material.dart';
import 'package:layer_complain/presentation/screen/add_complains/component/add_complaint_data_widget.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';

class AddComplainsScreen extends StatefulWidget {
  const AddComplainsScreen({super.key});

  @override
  State<AddComplainsScreen> createState() => _AddComplainsScreenState();
}

class _AddComplainsScreenState extends State<AddComplainsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(bgColor: whiteColor, title: 'Submit Complaint'),
      body: Padding(
        padding: Utils.symmetric(),
        child: ListView(
          children: [
            /// ============== Add complaint Widget =========
            AddComplaintDataWidget(),
          ],
        ),
      ),
    );
  }
}
