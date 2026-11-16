import 'package:flutter/material.dart';

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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
