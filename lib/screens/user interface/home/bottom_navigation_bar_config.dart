import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        indicatorColor: Colors.white,
        destinations: [
          NavigationDestination(
            tooltip: "Home",
            selectedIcon: Icon(
              IconlyBold.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              IconlyLight.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              IconlyBold.chat,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              IconlyLight.wallet,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Chat",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              IconlyBold.paper_download,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              IconlyLight.graph,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Applied",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              IconlyBold.setting,
              color: Theme.of(context).colorScheme.primary,
            ),
            icon: Icon(
              IconlyLight.profile,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
