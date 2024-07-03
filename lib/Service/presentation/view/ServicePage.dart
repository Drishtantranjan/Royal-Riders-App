import 'package:flutter/material.dart';
import 'package:royal_riders_application/Common_widgets/Button.dart';
import 'package:royal_riders_application/Common_widgets/appBar_with_divider.dart';

class Servicepage extends StatelessWidget {
  const Servicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppbarWithDivider(title: "Service Mode"),
        RoundedButton(title: "Locate Nearest Service Center", onPressed: () {})
      ],
    );
  }
}
