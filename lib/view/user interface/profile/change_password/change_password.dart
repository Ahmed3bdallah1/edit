import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/reusable_text.dart';
import 'change_password_function.dart';

class ChangePassword extends StatefulWidget {
  final String token;

  const ChangePassword({super.key, required this.token});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obsecured = false;
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  // Constants constants=Constants();
  late final String token;

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change password"),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Row(children: [
                      ReusableAdjustedText(
                          message: "Enter old password", size: 16)
                    ]),
                    TextField(
                      controller: oldPasswordController,
                      obscureText: obsecured,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecured = !obsecured;
                                });
                              },
                              child: obsecured == false
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(CupertinoIcons.eye_slash)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                      // name: 'Main e-mail address',
                    ),
                    const SizedBox(height: 10),
                    const Row(children: [
                      ReusableAdjustedText(
                          message: "Enter new password", size: 16)
                    ]),
                    TextField(
                      controller: newPasswordController,
                      obscureText: obsecured,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecured = !obsecured;
                                });
                              },
                              child: obsecured == false
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(CupertinoIcons.eye_slash)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                      // name: 'Main e-mail address',
                    ),
                    const SizedBox(height: 10),
                    const Row(children: [
                      ReusableAdjustedText(
                          message: "confirm password", size: 16)
                    ]),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: obsecured,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecured = !obsecured;
                                });
                              },
                              child: obsecured == false
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(CupertinoIcons.eye_slash)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  // height: 40,
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        ChangePasswordFunction()
                            .changePassword(newPasswordController.text,context);
                        Navigator.pop(context);
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CupertinoAlertDialog(
                                title: const Text("failed to edit"),
                                content: const Text(
                                  "password didn't match",
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('retry')),
                                ],
                              );
                            });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent)),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                // EndButton(onPressed: constants.api, name: 'Save'),
              ],
            ),
          )),
    );
  }
}
