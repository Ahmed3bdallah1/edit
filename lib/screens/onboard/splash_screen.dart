import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/managers/managers.dart';
import '../user interface/home/bottom_navigation_bar_config.dart';
import '../widgets/reusable_text.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected = false;

  Widget screen() {
    if (generalToken.isNotEmpty) {
      //JobsCubit.get(context).getAllJobs();
      return const NavigationBarConfig();
    }
    return const OnBoard();
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  void reloadApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SplashScreen()),
    );
  }

  void exitApp() {
    Navigator.pop(context);
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
      });
    } else {
      setState(() {
        isConnected = true;
      });
    }

    Timer(const Duration(seconds: 2), () {
      if (isConnected) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => screen(),
          ),
        );
      } else {
        showDialog(
            context: context,
            builder: (_) {
              return CupertinoAlertDialog(
                  title: const Text("check connection first"),
                  actions: [
                    CupertinoDialogAction(
                        child: const Text("retry"),
                        onPressed: () {
                          reloadApp();
                        }),
                    CupertinoDialogAction(
                        child: const Text("exit"),
                        onPressed: () {
                          exitApp();
                        })
                  ]);
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ReusableBigText(message: "J"),
                Icon(CupertinoIcons.scope, color: Colors.blueAccent),
                ReusableBigText(message: "BSQUE")
              ],
            )
          ],
        ),
      ),
    );
  }
}
