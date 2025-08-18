import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';

class MonthAndYearBtn extends StatefulWidget {
  const MonthAndYearBtn({super.key});

  @override
  State<MonthAndYearBtn> createState() => _MonthAndYearBtnState();
}

class _MonthAndYearBtnState extends State<MonthAndYearBtn> {
  String selectedBilling = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 50.h,
      padding: Utils.symmetric(h: 0.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedBilling = 'Monthly'),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color:
                  selectedBilling == 'Monthly'
                      ? primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow:
                  selectedBilling == 'Monthly'
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    'Monthly',
                    style: TextStyle(
                      color:
                      selectedBilling == 'Monthly'
                          ? Colors.white
                          : Colors.grey[700],
                      fontWeight:
                      selectedBilling == 'Monthly'
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedBilling = 'Yearly'),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color:
                  selectedBilling == 'Yearly'
                      ? primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow:
                  selectedBilling == 'Yearly'
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    'Yearly',
                    style: TextStyle(
                      color:
                      selectedBilling == 'Yearly'
                          ? Colors.white
                          : Colors.grey[700],
                      fontWeight:
                      selectedBilling == 'Yearly'
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
