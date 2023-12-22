import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/managers/navigation.dart';
import 'package:provider/provider.dart';
import '../../../models/models/provider_models/jobs_services.dart';
import '../../widgets/country_bubble.dart';
import '../../widgets/reusable_text.dart';
import 'get_started.dart';

class WorkLocationScreen extends StatefulWidget {
  const WorkLocationScreen({super.key});

  @override
  State<WorkLocationScreen> createState() => _WorkLocationScreenState();
}

class _WorkLocationScreenState extends State<WorkLocationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final TabController tabController = TabController(
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 700));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Flexible(
                    child: ReusableBigText(
                        message: "Where are you preferred Location?"))
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Flexible(
                  child: ReusableAdjustedText(
                      message:
                          "Let us know, where is the work location you want at this time, so we can adjust it.",
                      size: 12,
                      color: Colors.grey),
                )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              // width: width,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: CupertinoColors.opaqueSeparator,
                    style: BorderStyle.solid,
                    width: 1),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(30)),
                controller: tabController,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: width * .5,
                      child: const Center(
                          child: ReusableAdjustedText(
                        message: 'On site',
                        size: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: width * .5,
                      child: const Center(
                        child: ReusableAdjustedText(
                          message: 'remote',
                          size: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ReusableAdjustedText(
                  message: "Select the country you want for your job",
                  size: 12,
                  color: Colors.black.withOpacity(.7),
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height * .45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "United States",
                                photoAssetRoute: "assets/job_location/usa.png",
                                index: 0),
                            CountryBubble(
                                name: "Malaysia",
                                photoAssetRoute:
                                    "assets/job_location/malisia.png",
                                index: 1),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "indonisia",
                                photoAssetRoute:
                                    "assets/job_location/indonisia.png",
                                index: 2),
                            CountryBubble(
                                name: "singapora",
                                photoAssetRoute:
                                    "assets/job_location/sinagpora.png",
                                index: 4),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "vietnam",
                                photoAssetRoute:
                                    "assets/job_location/vietnam.png",
                                index: 5),
                            CountryBubble(
                                name: "philiphines",
                                photoAssetRoute:
                                    "assets/job_location/philiphines.png",
                                index: 6),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CountryBubble(
                                name: "argentina",
                                photoAssetRoute:
                                    "assets/job_location/argantina.png",
                                index: 7),
                            CountryBubble(
                                name: "canada",
                                photoAssetRoute:
                                    "assets/job_location/canada.png",
                                index: 9),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "Saudi Arabia",
                                photoAssetRoute:
                                    "assets/job_location/saudi_arabia.png",
                                index: 10),
                            CountryBubble(
                                name: "Brazil",
                                photoAssetRoute:
                                    "assets/job_location/brazil.png",
                                index: 11),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "china",
                                photoAssetRoute:
                                    "assets/job_location/china.png",
                                index: 8),
                            CountryBubble(
                                name: "polanda",
                                photoAssetRoute:
                                    "assets/job_location/polandia.png",
                                index: 12),
                            CountryBubble(
                                name: "india",
                                photoAssetRoute:
                                    "assets/job_location/india.png",
                                index: 3),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "United States",
                                photoAssetRoute: "assets/job_location/usa.png",
                                index: 0),
                            CountryBubble(
                                name: "Malaysia",
                                photoAssetRoute:
                                    "assets/job_location/malisia.png",
                                index: 1),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "indonisia",
                                photoAssetRoute:
                                    "assets/job_location/indonisia.png",
                                index: 2),
                            CountryBubble(
                                name: "singapora",
                                photoAssetRoute:
                                    "assets/job_location/sinagpora.png",
                                index: 4),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "vietnam",
                                photoAssetRoute:
                                    "assets/job_location/vietnam.png",
                                index: 5),
                            CountryBubble(
                                name: "philiphines",
                                photoAssetRoute:
                                    "assets/job_location/philiphines.png",
                                index: 6),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CountryBubble(
                                name: "argentina",
                                photoAssetRoute: "assets/argantina.png",
                                index: 7),
                            CountryBubble(
                                name: "canada",
                                photoAssetRoute: "assets/canada.png",
                                index: 9),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "Saudi Arabia",
                                photoAssetRoute:
                                    "assets/job_location/saudi_arabia.png",
                                index: 10),
                            CountryBubble(
                                name: "Brazil",
                                photoAssetRoute:
                                    "assets/job_location/brazil.png",
                                index: 11),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CountryBubble(
                                name: "china",
                                photoAssetRoute:
                                    "assets/job_location/china.png",
                                index: 8),
                            CountryBubble(
                                name: "polanda",
                                photoAssetRoute:
                                    "assets/job_location/polandia.png",
                                index: 12),
                            CountryBubble(
                                name: "india",
                                photoAssetRoute:
                                    "assets/job_location/india.png",
                                index: 3),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Consumer<JobModels>(
              builder: (BuildContext context, jobModel, _) {
                int counter = context.read<JobModels>().countryCounter;
                return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: width,
                    child: ElevatedButton(
                      onPressed: () {
                        navigateToNextScreen(context, const GetStartedPage());
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
