import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utill/constants/color_manager.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final String initialSelectedType;
  final void Function(String) onChanged;

  const DropDownMenu({
    super.key,
    required this.items,
    required this.initialSelectedType,
    required this.onChanged,
  });

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  late String selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialSelectedType;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: const BorderSide(color: ColorsManager.higherBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            borderSide: const BorderSide(color: ColorsManager.higherBlue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          filled: true,
          fillColor: ColorsManager.white,
        ),
        validator: (value) => value == null ? "Select Participant Type" : null,
        dropdownColor: ColorsManager.white,
        hint: const Text("Select Participant Type"),
        value: selectedType,
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue!;
            widget.onChanged(
                selectedType); // Pass the selected value to the callback
          });
        },
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            enabled: true,
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
