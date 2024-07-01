import 'package:flutter/material.dart';

class AppbarWithDivider extends StatelessWidget {
  final String title;
  const AppbarWithDivider({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 3.0, bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Container(
        height: 3,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
