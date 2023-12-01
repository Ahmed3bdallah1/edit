import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/job_bubble.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/services/auth/register_services/work_location.dart';
import 'package:graduation_project/services/models/provider_models/jobs_services.dart';
import 'package:provider/provider.dart';

class JobSelectionScreen extends StatefulWidget {
  const JobSelectionScreen({super.key});

  @override
  State<JobSelectionScreen> createState() => _JobSelectionScreenState();
}

class _JobSelectionScreenState extends State<JobSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Flexible(
                  child: ReusableBigText(
                      message: "What type of work are you interested in?"),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Flexible(
                  child: ReusableAdjustedText(
                      message:
                          "Tell us what you’re interested in so we can customise the app for your needs.",
                      size: 12,
                      color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: height * .6,
              width: width,
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: CupertinoColors.opaqueSeparator,
              //         style: BorderStyle.solid,
              //         width: 2),
              //     borderRadius: BorderRadius.circular(15)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      JobBubble(
                        icon: Icons.format_color_fill_sharp,
                        jobTitle: "UI/UX Designer",
                        index: 0,
                      ),
                      JobBubble(
                        icon: Icons.pinch,
                        jobTitle: "Illustrator\nDesigner",
                        index: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      JobBubble(
                        icon: Icons.computer_outlined,
                        jobTitle: "developer",
                        index: 2,
                      ),
                      JobBubble(
                        icon: Icons.manage_accounts_outlined,
                        jobTitle: "Management",
                        index: 3,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      JobBubble(
                        icon: Icons.copy_all,
                        jobTitle: "Information\ntechnology",
                        index: 4,
                      ),
                      JobBubble(
                        icon: Icons.cloud_done_sharp,
                        jobTitle: "Research",
                        index: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Consumer<JobModels>(
              builder: (BuildContext context, jobModel, _) {
                int counter = context.read<JobModels>().counter;
                return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const WorkLocationScreen()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent)),
                      child: counter == 0
                          ? const ReusableAdjustedText(
                              message: "Next",
                              size: 16,
                              color: CupertinoColors.white,
                            )
                          : ReusableAdjustedText(
                              message: "Selected $counter",
                              size: 16,
                              color: CupertinoColors.white,
                            ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
