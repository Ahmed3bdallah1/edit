import 'package:flutter/material.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_cubit.dart';
import '../../../core/managers/managers.dart';
import '../messages/messages_screen.dart';
import '../profile/profile_screen.dart';
import 'applied_jobs.dart';
import 'home_screen.dart';

class NavigationBarConfig extends StatefulWidget {
  const NavigationBarConfig({super.key});

  @override
  State<NavigationBarConfig> createState() => _NavigationBarConfigState();
}

class _NavigationBarConfigState extends State<NavigationBarConfig> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(token: generalToken),
    const MessagesScreen(),
    AppliedJobs(token: generalToken),
    ProfileScreen(token: generalToken),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard), label: "Applied"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
