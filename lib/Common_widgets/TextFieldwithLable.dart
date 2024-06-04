import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged; // New parameter
  final String? errorText; // New parameter
  final InputBorder? errorBorder; // New parameter

  const TextFieldWithLabel({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged, // Added onChanged parameter
    this.errorText, // Added errorText parameter
    this.errorBorder, // Added errorBorder parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.white,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged:
              onChanged, // Passed onChanged parameter to the TextFormField
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorText: errorText, // Set error text
            errorBorder: errorBorder, // Set error border
          ),
        ),
      ],
    );
  }
}
