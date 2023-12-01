import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/transition/page_route_transition.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/services/models/api_constants.dart';

import '../apply_job/apply_job1.dart';

class JobDetails extends StatefulWidget {
  final Map<String, dynamic> item;

  const JobDetails({super.key, required this.item});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ReusableBigText(message: "Job details"),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                SizedBox(height: 30, width: width),
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(widget.item["image"], width: 60)),
                const SizedBox(height: 10),
                ReusableAdjustedText(
                  message: widget.item['name'],
                  size: 18,
                  fontWeight: FontWeight.w400,
                ),
                ReusableAdjustedText(
                  message: "${widget.item['comp_name']} . Egypt",
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent.withOpacity(.3)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: ReusableAdjustedText(
                                message: widget.item["job_time_type"],
                                size: 14,
                                color: Colors.indigo),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent.withOpacity(.3)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: ReusableAdjustedText(
                                message: widget.item['job_type'],
                                size: 13,
                                color: Colors.indigo),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueAccent.withOpacity(.2)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: ReusableAdjustedText(
                                message: "level ${widget.item["job_level"]}",
                                size: 13,
                                color: Colors.indigo),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: width * .9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: Colors.indigo.shade900,
                          borderRadius: BorderRadius.circular(30)),
                      controller: tabController,
                      isScrollable: false,
                      tabs: const [
                        Tab(
                          child: SizedBox(
                            // width: width * .36,
                            child: Center(
                                child: ReusableAdjustedText(
                              message: 'Description',
                              size: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            // width: width * .33,
                            child: Center(
                              child: ReusableAdjustedText(
                                message: 'Company',
                                size: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            // width: width * .33,
                            child: Center(
                              child: ReusableAdjustedText(
                                message: 'People',
                                size: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .9,
                  height: height * .5,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                ReusableAdjustedText(
                                  message: "Job Description",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(children: [
                                Flexible(
                                    child: ReusableAdjustedText(
                                        message: widget.item["job_description"],
                                        size: 10))
                              ]),
                            ),
                            const Row(
                              children: [
                                ReusableAdjustedText(
                                  message: "Skill Required",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Row(children: [
                                Flexible(
                                    child: ReusableAdjustedText(
                                        message: widget.item["job_skill"],
                                        size: 10))
                              ]),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                ReusableAdjustedText(
                                  message: "Contact us",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: width * .44,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ReusableAdjustedText(
                                                    message: "Email",
                                                    size: 10,
                                                    color:
                                                        Colors.grey.shade700),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            ReusableAdjustedText(
                                              message:
                                                  widget.item["comp_email"],
                                              size: 12,
                                              color: CupertinoColors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      width: width * .44,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                ReusableAdjustedText(
                                                    message: "Website",
                                                    size: 10,
                                                    color:
                                                        Colors.grey.shade700),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            ReusableAdjustedText(
                                              message:
                                                  widget.item["comp_website"],
                                              size: 10,
                                              color: CupertinoColors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            const Row(
                              children: [
                                ReusableAdjustedText(
                                  message: "About Company",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Row(children: [
                                Flexible(
                                    child: ReusableAdjustedText(
                                        message: widget.item["about_comp"],
                                        size: 10))
                              ]),
                            ),
                            const Row(
                              children: [
                                ReusableAdjustedText(
                                  message: "Location",
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Row(children: [
                                Flexible(
                                    child: ReusableAdjustedText(
                                        message: widget.item["location"],
                                        size: 10))
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        child: Container(
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, customPageRouteTransition(ApplyJobBioData(token: generalToken, jobId: widget.item["id"],)));
              },
              backgroundColor: Colors.indigo,
              child: const ReusableAdjustedText(
                message: 'Apply now',
                size: 14,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
