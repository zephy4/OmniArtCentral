import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  const DetailsRow(
      {required this.firstText, required this.secondText, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontFamily: "Proxima",
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          secondText,
          style: TextStyle(
            color: const Color.fromARGB(150, 158, 158, 158),
            fontSize: 14.sp,
            fontFamily: "Proxima",
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
