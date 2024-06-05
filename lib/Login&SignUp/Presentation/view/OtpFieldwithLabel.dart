import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otpfieldwithlabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const Otpfieldwithlabel({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
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
        const SizedBox(height: 20),
        OtpTextField(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          fieldWidth: 40,
          fieldHeight: 50,
          contentPadding: const EdgeInsets.all(5),
          numberOfFields: 6,
          showFieldAsBox: true,
          cursorColor: Colors.white,
          focusedBorderColor: Colors.white,
          keyboardType: TextInputType.number,
          textStyle: const TextStyle(color: Colors.white),
          onSubmit: (String otp) {
            controller.text = otp;
          },
        ),
      ],
    );
  }
}
