import 'package:flutter/material.dart';
import 'package:graduation_project/common/transition/page_route_transition.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/view/user%20interface/profile/edit_emil/second_edit_email.dart';

import '../../../../common/managers.dart';

class EditEmail extends StatefulWidget {
  final String token;

  const EditEmail({super.key, required this.token});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  late final TextEditingController emailController;

  late final String token;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit email"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Row(children: [
                  ReusableAdjustedText(message: "Main e-mail address", size: 16)
                ]),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  // name: 'Main e-mail address',
                ),
              ],
            ),
            SizedBox(
              // height: 40,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  if(emailController.text==generalEmail){
                    Navigator.push(context, customPageRouteTransition(SecondEditEmail(token: token)));
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent)),
                child: const Text("Save",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
