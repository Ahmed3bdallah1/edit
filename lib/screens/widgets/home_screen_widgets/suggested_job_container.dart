import 'package:flutter/material.dart';

import '../../../core/managers/managers.dart';
import '../../../core/managers/navigation.dart';
import '../../../core/managers/utils/colors/colors.dart';
import '../../user interface/apply_job/apply_job1.dart';
import '../../user interface/home/job_details.dart';
import '../reusable_text.dart';

class SuggestedJobContainerHS extends StatefulWidget {
  final Map<String, dynamic> item;

  const SuggestedJobContainerHS({super.key, required this.item});

  @override
  State<SuggestedJobContainerHS> createState() =>
      _SuggestedJobContainerHSState();
}

class _SuggestedJobContainerHSState extends State<SuggestedJobContainerHS> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ColorConstantsGradient colorConstants = ColorConstantsGradient();
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, customPageRouteTransition(JobDetails(item: widget.item)));
      },
      child: Container(
        height: 180,
        width: width * .85,
        decoration: BoxDecoration(
            gradient: colorConstants.linearGradientWhiteBlue,
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              fit: BoxFit.fill,
                image: AssetImage("assets/onboard/card7.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.item["image"],
                            width: 50,
                            // fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          ReusableAdjustedText(
                            message: widget.item["name"],
                            size: 14,
                            color: Colors.white,
                          ),
                          ReusableAdjustedText(
                            message:
                                "${widget.item["comp_name"] ?? "Amit"}  .  Egypt",
                            size: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: isSelected == false
                            ? const Icon(Icons.push_pin_outlined,
                                color: Colors.white)
                            : const Icon(Icons.push_pin, color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: ReusableAdjustedText(
                          message: widget.item["job_time_type"],
                          size: 13,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: ReusableAdjustedText(
                          message: widget.item["job_type"],
                          size: 13,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.2)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: ReusableAdjustedText(
                          message: "level ${widget.item["job_level"]}",
                          size: 13,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableAdjustedText(
                      message: "${widget.item["salary"]}/Month",
                      size: 24,
                      color: Colors.white),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                customPageRouteTransition(ApplyJobBioData(
                                  token: generalToken,
                                  jobId: widget.item["id"],
                                )));
                          },
                          child: const ReusableAdjustedText(
                            message: "apply now",
                            size: 14,
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
