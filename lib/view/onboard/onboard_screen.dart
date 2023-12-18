import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/transition/page_route_transition.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/view/onboard/second_onboard.dart';
import 'package:graduation_project/view/onboard/third_onboard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../services/auth/login_service/login_page.dart';
import 'first_onboard.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController pageController = PageController();

  final int totalPages = 3;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Row(
            children: [
              SizedBox(width: 10),
              ReusableBigText(message: "J"),
              Icon(CupertinoIcons.scope, color: Colors.blueAccent),
              ReusableBigText(message: "BSQUE")
            ],
          ),
          leadingWidth: 120,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, customPageRouteTransition(const Login()));
                },
                child: const ReusableSmallText(message: "Skip")),
            const SizedBox(width: 20)
          ],
        ),
        body: Stack(children: [
          PageView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              children: const [
                FirstOnboard(),
                SecondOnboard(),
                ThirdOnboard()
              ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: SizedBox(
                      height: 80,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: const WormEffect(
                                  spacing: 5,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  dotColor: Colors.grey),
                            ),
                            GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);

                                  pageController.addListener(() {
                                    final currentPage = pageController.page;
                                    if (currentPage == totalPages - 1) {
                                      Timer(const Duration(seconds: 1), () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Center(
                                        child: ReusableBigTextWhite(
                                            message: "Next"))))
                          ]))))
        ]));
  }
}
