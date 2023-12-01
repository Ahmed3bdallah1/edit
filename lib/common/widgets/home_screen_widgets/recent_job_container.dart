import 'package:flutter/material.dart';
import '../../../view/user interface/home/job_details.dart';
import '../../transition/page_route_transition.dart';
import '../reusable_text.dart';

class RecentJobContainerHs extends StatefulWidget {
  final Map<String, dynamic> item;

  const RecentJobContainerHs({super.key, required this.item});

  @override
  State<RecentJobContainerHs> createState() => _RecentJobContainerHsState();
}

class _RecentJobContainerHsState extends State<RecentJobContainerHs> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, customPageRouteTransition(JobDetails(item: widget.item)));
      },
      child: Container(
        height: 130,
        width: width * .8,
        decoration: BoxDecoration(
            // color: Colors.indigo.shade900,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
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
                            size: 13,
                            color: Colors.black,
                          ),
                          ReusableAdjustedText(
                            message: "${widget.item["comp_name"] ?? "Amit"}  .  Egypt",
                            size: 12,
                            color: Colors.black,
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
                                color: Colors.black)
                            : const Icon(Icons.push_pin, color: Colors.black)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black.withOpacity(.4)),
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
                        color: Colors.black.withOpacity(.4)),
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
                        color: Colors.black.withOpacity(.4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: ReusableAdjustedText(
                          message: "level ${widget.item["job_level"]}",
                          size: 13,
                          color: Colors.white),
                    ),
                  ),
                  ReusableAdjustedText(
                      message: "${widget.item["salary"]}/M",
                      size: 14,
                      color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
