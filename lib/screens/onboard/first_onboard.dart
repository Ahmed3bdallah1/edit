import 'package:flutter/material.dart';

class FirstOnboard extends StatelessWidget {
  const FirstOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/onboard/firstscreen.png'),
        const Padding(
          padding: EdgeInsets.only(left: 10,right: 20,top: 10),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Find a job, and start building your career from now on",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10,top: 5,right: 20),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Explore over 25,924 available job roles and upgrade your operator now.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
