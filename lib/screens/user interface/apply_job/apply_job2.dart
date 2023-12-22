import 'package:flutter/material.dart';
import '../../../core/managers/managers.dart';
import '../../../core/managers/navigation.dart';
import '../../../core/managers/utils/colors/colors.dart';
import '../../widgets/home_screen_widgets/type_of_work_container.dart';
import '../../widgets/reusable_text.dart';
import 'apply_job3.dart';

class ApplyJobWorkType extends StatefulWidget {
  final int jobId;
  final String number;
  final String name;
  final String email;

  const ApplyJobWorkType(
      {super.key,
      required this.jobId,
      required this.number,
      required this.email,
      required this.name});

  @override
  State<ApplyJobWorkType> createState() => _ApplyJobWorkTypeState();
}

class _ApplyJobWorkTypeState extends State<ApplyJobWorkType> {
  ColorConstantsGradient gradient = ColorConstantsGradient();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const ReusableBigText(message: "Type of work"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    ClipOval(
                        child: Container(
                      decoration:
                          BoxDecoration(gradient: gradient.linearGradientBlue),
                      height: 50,
                      width: 50,
                      child: const Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                      )),
                    )),
                    const SizedBox(height: 5),
                    const ReusableAdjustedText(
                        message: "Biodata", size: 12, color: Colors.blue)
                  ]),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(25)),
                          height: 50,
                          width: 50,
                          child: const Center(
                              child: ReusableAdjustedText(
                                  message: "2",
                                  size: 16,
                                  color: Colors.blueAccent))),
                      const SizedBox(height: 5),
                      const ReusableAdjustedText(
                          message: "Type of work",
                          size: 12,
                          color: Colors.blueAccent)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25)),
                          height: 50,
                          width: 50,
                          child: const Center(
                              child: ReusableAdjustedText(
                                  message: "3",
                                  size: 16,
                                  color: Colors.black))),
                      const SizedBox(height: 5),
                      const ReusableAdjustedText(
                          message: "portfolio", size: 12, color: Colors.black)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(children: [
                    ReusableAdjustedText(message: "Type of work", size: 20),
                  ]),
                  const Row(children: [
                    ReusableAdjustedText(
                        message: "Fill in your bio data correctly", size: 14),
                  ]),
                  const SizedBox(height: 20),
                  const WorkTypeContainer(
                      index: 0, jobTitle: "Senior UI/UX designer"),
                  const SizedBox(height: 20),
                  const WorkTypeContainer(
                      index: 1, jobTitle: "Flutter developer"),
                  const SizedBox(height: 20),
                  const WorkTypeContainer(
                      index: 2, jobTitle: "Machine learning engineer"),
                  const SizedBox(height: 20),
                  const WorkTypeContainer(
                      index: 3, jobTitle: "Cyber security eng"),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: width,
                      child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          onPressed: () {
                            Navigator.push(
                                context,
                                customPageRouteTransition(ApplyJobAddPortfolio(
                                    list: [
                                      widget.jobId,
                                      generalID,
                                      widget.name,
                                      widget.email,
                                      widget.number,
                                      "full"
                                    ])));
                          },
                          child: const ReusableAdjustedText(
                              message: 'Next', size: 14, color: Colors.white)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
