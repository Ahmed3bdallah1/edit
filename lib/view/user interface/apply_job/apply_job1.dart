import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/transition/page_route_transition.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import '../../../common/managers.dart';
import '../../../common/utils/colors/colors.dart';
import 'apply_job2.dart';

class ApplyJobBioData extends StatefulWidget {
  final String token;
  final int jobId;

  const ApplyJobBioData({super.key, required this.token, required this.jobId});

  @override
  State<ApplyJobBioData> createState() => _ApplyJobBioDataState();
}

class _ApplyJobBioDataState extends State<ApplyJobBioData> {
  ColorConstantsGradient gradient = ColorConstantsGradient();
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController numberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: const ReusableBigText(message: "Apply Job"),
          centerTitle: true),
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
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25)),
                          height: 50,
                          width: 50,
                          child: const Center(
                              child: ReusableAdjustedText(
                                  message: "2",
                                  size: 16,
                                  color: Colors.black))),
                      const SizedBox(height: 5),
                      const ReusableAdjustedText(
                          message: "Type of work",
                          size: 12,
                          color: Colors.black)
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
                    ReusableAdjustedText(message: "Bio data", size: 20),
                  ]),
                  const Row(children: [
                    ReusableAdjustedText(
                        message: "Fill in your bio data correctly", size: 14),
                  ]),
                  const SizedBox(height: 20),
                  const Row(children: [
                    ReusableAdjustedText(message: "Full name", size: 20)
                  ]),
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                        hintText: generalName,
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 10),
                  const Row(children: [
                    ReusableAdjustedText(message: "Email", size: 20)
                  ]),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: generalEmail,
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(height: 10),
                  const Row(children: [
                    ReusableAdjustedText(message: "Ph.Number", size: 20)
                  ]),
                  TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                        hintText: "phone number",
                        prefixIcon: const Icon(Icons.phone_android),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  SizedBox(
                      width: width,
                      child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          onPressed: () {
                            if (numberController.text.isNotEmpty &&
                                emailController.text.isNotEmpty &&
                                fullNameController.text.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  customPageRouteTransition(ApplyJobWorkType(
                                    jobId: widget.jobId,
                                    number: numberController.text,
                                    email: emailController.text,
                                    name: fullNameController.text,
                                  )));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return CupertinoAlertDialog(
                                      title: const Text("error"),
                                      content: const Text(
                                          "you must enter all the fields"),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: const Text("ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
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
