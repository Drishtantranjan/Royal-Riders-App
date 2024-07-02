import 'package:flutter/material.dart';

class TextFieldWithLabelandDivider extends StatelessWidget {
  final String label;
  final String value;
  final double width;

  const TextFieldWithLabelandDivider({
    Key? key,
    required this.label,
    required this.value,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: width),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
