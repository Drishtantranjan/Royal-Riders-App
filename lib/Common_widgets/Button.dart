import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;

  const RoundedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.height = 50.0,
      this.width = double.infinity,
      this.color = Colors.red,
      this.borderRadius = 5.0,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
