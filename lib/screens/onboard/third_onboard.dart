import 'package:flutter/material.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/onboard/ThirdOnboard.png'),
            const Padding(
              padding: EdgeInsets.only(left: 10,top: 5),
              child: Row(
                children: [
                  Text(
                    "Hundreds of jobs\nare waiting for you to join us",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10,top: 5),
              child: Row(
                children: [
                  Text(
                    "Immediately join us\nand start applying for the job you are interested in..",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
