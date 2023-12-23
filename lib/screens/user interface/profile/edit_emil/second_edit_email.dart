import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_email/change_email_cubit.dart';
import 'package:graduation_project/core/controllers/profile_controllers/change_email/change_email_state.dart';
import '../../../../core/managers/utils/dialogs/snak_bar.dart';
import '../../../widgets/reusable_text.dart';

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
    return BlocConsumer<ChangeEmailCubit, ChangeEmailState>(
      listener: (context, state) {
        if (state is DoneChangeEmailState) {
          showSnakBar(context, "changed successfully");
          Timer(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        } else {
          showSnakBar(context, "error in changing your number");
        }
      },
      builder: (context, state) {
        ChangeEmailCubit cubit = ChangeEmailCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("New email"),
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
                      ReusableAdjustedText(
                          message: "New e-mail address", size: 16)
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
                      cubit.editEmail(context, newEmailController.text);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent)),
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
