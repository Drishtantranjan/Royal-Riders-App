import 'package:flutter/material.dart';

class RideContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Widget? child;

  const RideContainer({
    Key? key,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: decoration ??
            BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
        child: child,
      ),
    );
  }
}
