import 'package:flutter/material.dart';

import '../Common_widgets/Tab_Index_Line.dart';
import 'MyRideScreen.dart';
import 'MyZoneScreen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool isMyZoneSelected = true; // State variable for "My Zone" tab

  void _onTabTapped(bool isMyZone) {
    setState(() {
      isMyZoneSelected = isMyZone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _onTabTapped(true),
                  child: Column(
                    children: [
                      Text(
                        "My Zone",
                        style: TextStyle(
                          fontSize: 15,
                          color: isMyZoneSelected ? Colors.white : Colors.grey,
                          fontWeight: isMyZoneSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TabIndexLine(isSelected: isMyZoneSelected),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onTabTapped(false),
                  child: Column(
                    children: [
                      Text(
                        "My Rides",
                        style: TextStyle(
                          fontSize: 15,
                          color: isMyZoneSelected ? Colors.grey : Colors.white,
                          fontWeight: isMyZoneSelected
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TabIndexLine(isSelected: !isMyZoneSelected),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: isMyZoneSelected ? MyZone() : MyRides(),
        ),
      ],
    );
  }
}

// Define two different widgets for the two screens
class MyZone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoneScreen();
  }
}

class MyRides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRidesScreen();
  }
}
