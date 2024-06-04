import 'package:flutter/material.dart';

class TabIndexLine extends StatelessWidget {
  final bool isSelected;

  const TabIndexLine({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 150,
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
