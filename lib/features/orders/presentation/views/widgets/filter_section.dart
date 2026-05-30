import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_data.dart';
import 'filter_section_item.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key, required this.statusChanged});
  final ValueChanged<int> statusChanged;
  static final List<String> filterList = [
    "الكل",
    "نشط",
    "مكتمل",
    "ملغي",
    "مسلمة",
  ];

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: List.generate(
        FilterSection.filterList.length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.statusChanged(selectedIndex);
              });
            },
            child: FilterSectionItem(
              textContent: FilterSection.filterList[index],
              textColor: selectedIndex == index
                  ? Colors.white
                  : ColorsData.kLightPrimaryColor,
              backgroundColor: selectedIndex == index
                  ? ColorsData.kLightPrimaryColor
                  : Colors.white,
              borderColor: ColorsData.kLightPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
