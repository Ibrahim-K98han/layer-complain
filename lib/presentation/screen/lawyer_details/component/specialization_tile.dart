import 'package:flutter/material.dart';

import '../../../../utils/constraints.dart';
import '../../../../widgets/custom_text.dart';

class SpecializationTile extends StatefulWidget {
  const SpecializationTile({super.key});

  @override
  State<SpecializationTile> createState() => _SpecializationTileState();
}

class _SpecializationTileState extends State<SpecializationTile> {
  final List<String> specialization_areas = [
    'Architect',
    'UI/UX',
    'Graphic Design',
    'Finance',
    'Art',
    'Teacher',
    'Doctor',
    'Lawyer',
    'Chef',
    'WP Developer',
    'HTML',
  ];
  List<int> specializationAreaIndex = [];
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        title: CustomText(
          text: 'Specialization Areas',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        children: [
          _buildChips(
            specialization_areas,
            specializationAreaIndex,
            (index) {},
          ),
        ],
      ),
    );
  }

  Widget _buildChips(
    List<String> items,
    List<int> selectedIndexes,
    Function(int) onTap,
  ) {
    return Wrap(
      spacing: 6,
      runSpacing: 2,
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
            backgroundColor: selected ? primaryColor : whiteColor,
            shape: StadiumBorder(
              side: BorderSide(
                color: selected ? primaryColor : inputFillBorderColor,
              ),
            ),
          ),
        );
      }),
    );
  }
}
