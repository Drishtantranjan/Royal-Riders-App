import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:royal_riders_application/Community/Community.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CommunityPage(),
    const MotorcyclePage(),
    const ShopPage(),
    const ServicePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF151414),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: SvgPicture.asset(
            "assets/HomePage/ROYAL RIDERS.svg",
            width: 150,
          ),
          backgroundColor: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/HomePage/Community_inc.png",
              width: 40,
              height: 50,
            ),
            activeIcon: Image.asset(
              "assets/HomePage/Community_ac.png",
              width: 40,
              height: 50,
            ),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/HomePage/Motorcycle_inc.png",
              width: 50,
              height: 50,
            ),
            activeIcon: Image.asset(
              "assets/HomePage/Motorcycle_ac.png",
              width: 50,
              height: 50,
            ),
            label: "Motorcycle",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/HomePage/Shop_inc.png",
              width: 40,
              height: 50,
            ),
            activeIcon: Image.asset(
              "assets/HomePage/Shop_ac.png",
              width: 40,
              height: 50,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/HomePage/Service_inc.png",
              width: 50,
              height: 50,
            ),
            activeIcon: Image.asset(
              "assets/HomePage/Service_ac.png",
              width: 50,
              height: 50,
            ),
            label: "Service",
          ),
        ],
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommunityScreen();
  }
}

class MotorcyclePage extends StatelessWidget {
  const MotorcyclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Motorcycle Page'));
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Shop Page'));
  }
}

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Service Page'));
  }
}
