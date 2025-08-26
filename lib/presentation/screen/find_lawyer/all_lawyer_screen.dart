import 'package:flutter/material.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/k_images.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_image.dart';

import '../../../utils/utils.dart';
import 'component/filter_bottom_sheet_all_lawyer.dart';
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
            child: LawyerContainer(horizontalMargin: 12.0),
          );
        },
      ),
    );
  }
}
