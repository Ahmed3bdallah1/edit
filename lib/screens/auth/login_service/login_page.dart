import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/managers/managers.dart';
import 'package:graduation_project/screens/user%20interface/home/bottom_navigation_bar_config.dart';
import '../../../core/controllers/auth_controllers/login_cubit/login_cubit.dart';
import '../../../core/controllers/auth_controllers/login_cubit/login_state.dart';
import '../../../core/local/shared_preferences.dart';
import '../../../core/managers/navigation.dart';
import '../../../core/managers/utils/dialogs/snak_bar.dart';
import '../../../core/remote/api_constants.dart';
import '../../widgets/reusable_text.dart';
import '../register_services/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ApiConstants constants = ApiConstants();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscure = true;
  bool rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LogInState>(
      listener: (context, state) {
        if (state is DoneStateSignIn) {
          if (state.model.status == true) {
            debugPrint(state.model.status.toString());
            CacheHelper.saveData(key: "userId", value: state.model.user.id)
                .then((value) {
              generalID = state.model.user.id;
            });
            CacheHelper.saveData(key: "token", value: state.model.token)
                .then((value) {
              generalToken = state.model.token;
              navigateAndFinishThisScreen(context, const NavigationBarConfig());
            });
          } else {
            debugPrint(state.model.status.toString());
            showSnakBar(context, "error in login please try again");
          }
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
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
          body: ListView(
            children: [
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
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                      const Row(children: [
                        Flexible(
                          child: Text(
                            "Please login to find your dream job",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      ]),
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
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      rememberMe = !rememberMe;
                                    });
                                  },
                                  icon: rememberMe == true
                                      ? const Icon(
                                          Icons.radio_button_checked,
                                          color: Colors.blue,
                                        )
                                      : const Icon(Icons.radio_button_off)),
                              const ReusableSmallText(
                                message: "Remember me.",
                              )
                            ],
                          ),
                          const Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Register()));
                            },
                            child: const Text("Register",
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
                            cubit.login(context, _emailController.text,
                                _passwordController.text);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent)),
                          child: const Text("Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      const Text("Or Login With Account",
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Image.asset("assets/onboard/logo.png")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
