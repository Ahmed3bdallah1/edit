import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_cubit.dart';
import 'package:graduation_project/core/controllers/jobs_cubit/jobs_state.dart';

import '../../widgets/home_screen_widgets/JobLists_widget.dart';
import '../../widgets/home_screen_widgets/silver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>?> jobsFuture;

  @override
  void initState() {
    super.initState();
    print('HomeScreen initState');
    jobsFuture = JobsCubit.get(context).getAllJobs();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<JobsCubit, JobsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              buildSliverAppBar(searchController),
              buildJobLists(height, jobsFuture),
            ],
          ),
        );
      },
    );
  }
}
