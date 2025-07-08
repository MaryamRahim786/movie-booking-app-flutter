import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_booking_app/common/extensions/num.dart';
import 'package:movies_booking_app/util/resources/r.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  final List<String> dates = [
    "5 July",
    "6 July",
    "7 July",
    "8 July",
    "9 July",
    "10 July",
    "11 July",
    "12 July",
    "13 July",
    "14 July",
    "15 July "
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Date",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          14.hb,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(dates.length, (index) {
                return _buildDateChip(dates[index], index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Builds a date chip with selection logic
  Widget _buildDateChip(String date, int index) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Chip(
          label: Text(date),
          backgroundColor: isSelected ? R.colors.blue_61C3F2 : Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
