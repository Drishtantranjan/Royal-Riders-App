import 'package:flutter/material.dart';
import 'package:royal_riders_application/Common_widgets/Button.dart';
import 'package:royal_riders_application/Common_widgets/appBar_with_divider.dart';
import 'package:royal_riders_application/Service/presentation/view/MapboxMapPage.dart';

class Servicepage extends StatelessWidget {
  const Servicepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarWithDivider(title: "Service Mode"),
          RoundedButton(
            title: "Locate Nearest Service Center",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapboxMapPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
