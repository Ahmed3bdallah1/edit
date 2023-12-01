import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/home_screen_widgets/recent_job_container.dart';
import 'package:graduation_project/common/widgets/home_screen_widgets/suggested_job_container.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/services/models/api_constants.dart';

import '../profile/profile_screen/profile_screen_function.dart';
import 'applied_jobs/get_all_jobs_function.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  late Future<List<Map<String, dynamic>>> allJobsData;
  late String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
    allJobsData = GetAllJobsFunction().getAllJobs();
    name = ProfileScreenFuction().getGeneralName;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(generalToken);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            title:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(children: [
                Text("Hi, $name👋", style: const TextStyle(fontSize: 18))
              ]),
              const Row(children: [
                Text('Create a better future for yourself here',
                    style: TextStyle(fontSize: 12))
              ]),
            ]),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                // color: Colors.grey,
                padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
                height: 120,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 52,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.notifications_on_rounded)),
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ReusableAdjustedText(
                              message: "Suggested Jobs", size: 18),
                          GestureDetector(
                            onTap: () {},
                            child: const ReusableAdjustedText(
                              message: "View all",
                              size: 14,
                              color: Colors.blueAccent,
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 200,
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: allJobsData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    "error occurred while receiving the data ${snapshot.error}"));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available.'));
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var item = snapshot.data![index];
                                print(item);
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SuggestedJobContainerHS(item: item),
                                    const SizedBox(width: 20)
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ReusableAdjustedText(
                              message: "Recent Jobs", size: 14),
                          GestureDetector(
                            onTap: () {},
                            child: const ReusableAdjustedText(
                              message: "View all",
                              size: 12,
                              color: Colors.blueAccent,
                            ),
                          )
                        ]),
                    SizedBox(
                      height: height * .7,
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: allJobsData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    "error occurred while receiving the data ${snapshot.error}"));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available.'));
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var item = snapshot.data![index];
                                print(item);
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RecentJobContainerHs(item: item),
                                    const SizedBox(height: 20)
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
              // Add more list items or widgets here
            ]),
          ),
        ],
      ),
    );
  }
}
