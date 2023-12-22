import 'package:flutter/material.dart';

import '../../widgets/notifications/notification_switcher.dart';
import '../../widgets/reusable_text.dart';

class Notifications extends StatelessWidget {
  final String token;
  const Notifications({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const ReusableBigText(message: "Notifications"),centerTitle: true,),
      body: ListView(
        children: [
        SafeArea(
            child: Column(
          children: [
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey, border: Border.all(color: Colors.black.withOpacity(.3))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Row(
                    children: [
                      ReusableAdjustedText(message: "Job Notifications", size: 14,color: Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
             const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Switcher(name: 'Your Job Search Alert'),
                    Switcher(name: 'Job Application Update'),
                    Switcher(name: 'Job Application Reminders'),
                    Switcher(name: 'Jobs You May Be Interested In'),
                    Switcher(name: 'Job Seeker Updates'),
                  ],
                )),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey, border: Border.all(color: Colors.black.withOpacity(.3))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Row(
                    children: [
                      ReusableAdjustedText(message: "Other Notifications", size: 14,color: Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Switcher(name: 'Show Profile'),
                    Switcher(name: 'All Message'),
                    Switcher(name: 'Message Nudges'),
                  ],
                )),
          ],
        )),
      ]
      ),
    );
  }
}