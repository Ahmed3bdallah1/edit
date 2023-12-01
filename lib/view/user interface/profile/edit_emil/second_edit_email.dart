import 'package:flutter/material.dart';
import '../../../../common/widgets/reusable_text.dart';
import 'edit_function.dart';

class SecondEditEmail extends StatefulWidget {
  final String token;

  const SecondEditEmail({super.key, required this.token});

  @override
  State<SecondEditEmail> createState() => _SecondEditEmailState();
}

class _SecondEditEmailState extends State<SecondEditEmail> {
  late TextEditingController newEmailController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newEmailController = TextEditingController();
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
                  controller: newEmailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  // name: 'Main e-mail address',
                ),
              ],
            ),
            SizedBox(
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  EditEmailFunction()
                      .editEmail(context, newEmailController.text);
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
