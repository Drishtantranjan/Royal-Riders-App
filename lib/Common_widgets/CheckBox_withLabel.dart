import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  CustomCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.grey,
          value: widget.value,
          onChanged: (bool? value) {
            setState(() {
              value = value!;
            });
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
