import 'package:flutter/material.dart';
import 'package:onmi_art_central/utill/constants/color_manager.dart';

class SheetDragHandler extends StatelessWidget {
  const SheetDragHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 4,
      width: 50,
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
