import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/services/auth/register_services/register_function.dart';
import 'package:graduation_project/services/remote/api_constants.dart';
import 'package:graduation_project/services/auth/login_service/login_page.dart';

import '../../../common/widgets/reusable_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  ApiConstants constants = ApiConstants();
  bool obscure = true;
  bool rememberMe = true;

  // final FirebaseAuthService _authService = FirebaseAuthService();

  void _register() async {
    final String email = _emailController.text.trim();
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    if (username.isNotEmpty && email.isNotEmpty && password.length >= 8) {
      RegisterFunction().register(context, email, username, password);
    } else {
      showDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
                title: const Text('check your info details correctly'),
                actions: [
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('ok')),
                ]);
          });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        actions: const [
          Row(
            children: [
              SizedBox(width: 10),
              ReusableBigText(message: "J"),
              Icon(CupertinoIcons.scope, color: Colors.blueAccent),
              ReusableBigText(message: "BSQUE")
            ],
          ),
        ],
      ),
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Create account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
                const Row(children: [
                  Flexible(
                    child: Text(
                      "Please Create account to find your dream job",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                ]),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.person),
                      labelText: "username",
                      filled: true,
                      fillColor: Colors.white.withOpacity(.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an username";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.person),
                      labelText: "email",
                      filled: true,
                      fillColor: Colors.white.withOpacity(.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.lock),
                      labelText: "password",
                      filled: true,
                      fillColor: Colors.white.withOpacity(.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: obscure
                              ? const Icon(CupertinoIcons.eye_slash_fill)
                              : const Icon(CupertinoIcons.eye))),
                  validator: (value) {
                    if (value!.length <= 8) {
                      return 'password must contains 8 characters';
                    }
                    return null;
                  },
                ),
                const Row(
                  children: [
                    Text(
                      "password must be 8 at least?",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("already have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const Login()));
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  // height: 40,
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent)),
                    child: const Text("Register",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const Text("Or Register With Account",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.blueAccent,
                          )),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset("assets/logo.png")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
