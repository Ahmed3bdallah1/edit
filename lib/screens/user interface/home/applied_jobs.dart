import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/controllers/apply_controllers/applied_cubit/applied_cubit.dart';
import '../../../core/controllers/apply_controllers/applied_cubit/applied_state.dart';
import '../../../core/remote/api_constants.dart';
import '../../widgets/reusable_text.dart';

class AppliedJobs extends StatefulWidget {
  final String token;

  const AppliedJobs({super.key, required this.token});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs>
    with TickerProviderStateMixin {
  ApiConstants constants = ApiConstants();
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppliedCubit, AppliedState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppliedCubit cubit = AppliedCubit.get(context);
        var appliedData = cubit.appliedJobsApi();
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: const Text("applied jobs")),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  width: width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30),
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
                            message: 'Active',
                            size: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: width * .5,
                          child: const Center(
                            child: ReusableAdjustedText(
                              message: 'Rejected',
                              size: 18,
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
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.7),
                                // borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: CupertinoColors.opaqueSeparator,
                                    style: BorderStyle.solid,
                                    width: 1)),
                            child: const Row(children: [
                              SizedBox(width: 5),
                              Text("Active Jobs")
                            ])),
                        Container(
                          height: height * .6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: appliedData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return SizedBox(
                                    height: 300,
                                    child: Center(
                                        child: Column(children: [
                                      Image.asset(
                                          "assets/onboard/getStarted.png"),
                                      const Text('No data available.'),
                                    ])));
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    var item = snapshot.data![index];
                                    print(item);
                                    return ListTile(
                                      title: Text(item['email'] ?? 'N/A'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(item['id']?.toString() ?? 'N/A'),
                                          Text(item['mobile']?.toString() ??
                                              'N/A'),
                                          Text(item['email'] ?? 'N/A'),
                                          Text(item['work_type'] ?? 'N/A'),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.7),
                                // borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: CupertinoColors.opaqueSeparator,
                                    style: BorderStyle.solid,
                                    width: 1)),
                            child: const Row(children: [
                              SizedBox(width: 5),
                              Text("Rejected Jobs")
                            ])),
                        Container(
                          height: height * .6,
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(
                            //     color: CupertinoColors.opaqueSeparator,
                            //     style: BorderStyle.solid,
                            //     width: 1),
                          ),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: appliedData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return SizedBox(
                                  height: 300,
                                  child: Center(
                                      child: Column(
                                    children: [
                                      Image.asset("assets/getStarted.png"),
                                      const Text('No data available.'),
                                    ],
                                  )),
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    var item = snapshot.data![index];
                                    print(item);
                                    return ListTile(
                                      title: Text(item['email'] ?? 'N/A'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item['id']?.toString() ?? 'N/A'),
                                          Text(item['mobile']?.toString() ??
                                              'N/A'),
                                          Text(item['email'] ?? 'N/A'),
                                          Text(item['work_type'] ?? 'N/A'),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
