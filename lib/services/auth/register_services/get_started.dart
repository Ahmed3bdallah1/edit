import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/services/auth/login_service/login_page.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * .48,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/onboard/getStarted.png"),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: ReusableAdjustedText(
                                message: "Your account has been set up!",
                                size: 18))
                      ]),
                  const SizedBox(height: 10),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: ReusableAdjustedText(
                                message:
                                    "please click below for proceeding to login page",
                                size: 10,
                                color: CupertinoColors.inactiveGray))
                      ])
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              width: width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent)),
                  child: const ReusableAdjustedText(
                    message: "Get Started",
                    size: 16,
                    color: CupertinoColors.white,
                  )))
        ],
      ),
    );
  }
}
