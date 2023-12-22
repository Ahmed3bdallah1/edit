import 'package:flutter/material.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/onboard/secondOnboard.png'),
        const Padding(
          padding: EdgeInsets.only(left: 10,top: 5,right: 20),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  "Hundreds of jobs are waiting for you to join us",
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
                  "Immediately join us and start applying for the job you are interested in..",
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
