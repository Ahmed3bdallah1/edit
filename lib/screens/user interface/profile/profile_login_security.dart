import 'package:flutter/material.dart';
import 'package:graduation_project/screens/user%20interface/profile/two_step_verification.dart';
import '../../../core/managers/managers.dart';
import '../../widgets/portifolio_widgets/other_buttoms.dart';
import '../../widgets/reusable_text.dart';
import 'change_password.dart';
import 'change_phone.dart';
import 'edit_emil/edit_email.dart';

class LoginAndSecurity extends StatefulWidget {
  final String token;

  const LoginAndSecurity({super.key, required this.token});

  @override
  State<LoginAndSecurity> createState() => _LoginAndSecurityState();
}

class _LoginAndSecurityState extends State<LoginAndSecurity> {
  @override
  Widget build(BuildContext context) {
    print(generalToken);
    return Scaffold(
        appBar: AppBar(
          title: const ReusableBigText(message: "Login and Security"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black.withOpacity(.3))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Row(
                  children: [
                    ReusableAdjustedText(
                      message: "Account Access",
                      size: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: OtherButton(
                    token: widget.token,
                    name: "Email address",
                    builder: (token) => EditEmail(token: token),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: OtherButton(
                    token: widget.token,
                    name: "Phone number",
                    builder: (token) => EditPhone(token: token),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: OtherButton(
                    token: widget.token,
                    name: "Change password",
                    builder: (token) => ChangePassword(token: token),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: OtherButton(
                    token: widget.token,
                    name: "Two-step verification",
                    builder: (token) => TwoStepVerification(token: token),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: OtherButton(
                    token: widget.token,
                    name: "Face ID",
                    builder: (token) => EditEmail(token: token),
                  ),
                ),
              ],
            ),
          )
        ])));
  }
}
