import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_cubit.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_state.dart';
import '../../../core/managers/managers.dart';
import '../../widgets/home_screen_widgets/recent_job_container.dart';
import '../../widgets/home_screen_widgets/suggested_job_container.dart';
import '../../widgets/reusable_text.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  const HomeScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    print("built");
    double height = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {},
      builder: (context, state) {
        JobsCubit cubit = JobsCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 140,
                pinned: true,
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text("Hi, $generalName👋",
                            style: const TextStyle(fontSize: 18))
                      ]),
                      const Row(children: [
                        Text('Create a better future for yourself here',
                            style: TextStyle(fontSize: 12))
                      ]),
                    ]),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    // color: Colors.grey,
                    padding:
                        const EdgeInsets.only(top: 35, left: 20, right: 20),
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
                            child: FutureBuilder<List<Map<String, dynamic>>?>(
                              future: cubit.getAllJobs(),
                              builder: (context, snapshot) {


                                // this is the error


                                return SizedBox(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      print("infinite loop");
                                      var dataItem = snapshot.data![index];
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SuggestedJobContainerHS(
                                              item: dataItem),
                                          const SizedBox(width: 20)
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            )),
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
                                      color: Colors.blueAccent))
                            ]),
                        SizedBox(
                            height: height * .7,
                            child: FutureBuilder<List<Map<String, dynamic>>?>(
                              future: cubit.getAllJobs(),
                              builder: (context, snapshot) {

                                // this is the error 2

                                print("--------------------");
                                return ListView.builder(
                                  itemCount: cubit.model!.data!.length,
                                  itemBuilder: (context, index) {
                                    var dataItem = snapshot.data![index];
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RecentJobContainerHs(item: dataItem),
                                        const SizedBox(height: 20)
                                      ],
                                    );
                                  },
                                );
                              },
                            )),
                      ],
                    ),
                  )
                  // Add more list items or widgets here
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
