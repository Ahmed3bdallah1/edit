import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/notifications/notification_switcher.dart';
import '../../widgets/reusable_text.dart';

class TwoStepVerification extends StatelessWidget {
  final String token;

  const TwoStepVerification({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const ReusableBigText(
          message: "Two step verification",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Switcher(
                name: 'Secure your account with\ntwo-step verification'),
            const SizedBox(height: 40),
            SizedBox(
              width: width,
              child: Row(
                children: [
                  ClipOval(
                      child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.blue.withOpacity(.3),
                          child: const Icon(
                            CupertinoIcons.lock,
                            color: Colors.indigoAccent,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                    child: ReusableAdjustedText(
                      message:
                          "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",
                      size: 12,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: width,
              child: Row(
                children: [
                  ClipOval(
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.withOpacity(.2),
                          ),
                          //
                          child: const Icon(
                            CupertinoIcons.doc_append,
                            color: Colors.indigoAccent,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  const Flexible(
                    child: ReusableAdjustedText(
                      message:
                          "Adding a phone number or using an authenticator will help keep your account safe from harm.",
                      size: 12,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              // height: 40,
              width: 330,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent)),
                child: const Text("Next",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
