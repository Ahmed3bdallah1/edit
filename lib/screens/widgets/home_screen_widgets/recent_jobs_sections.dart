import 'package:flutter/material.dart';
import 'package:graduation_project/screens/widgets/home_screen_widgets/recent_job_container.dart';
import 'package:graduation_project/screens/widgets/home_screen_widgets/suggested_Jobs_Section_Widget.dart';

Widget buildRecentJobsSection(double height, jobsFuture) {
  return Column(
    children: [
      buildSectionHeader("Recent Jobs", "View all"),
      FutureBuilder<List<Map<String, dynamic>>?>(
        future: jobsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: height * .4,
                child: const Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData && snapshot.data != null) {
            return buildRecentJobsList(snapshot.data!, height);
          } else {
            return const Center(child: Text("Error in getting data"));
          }
        },
      ),
    ],
  );
}

Widget buildRecentJobsList(List<Map<String, dynamic>> jobs, double height) {
  return SizedBox(
    height: height * .7,
    child: ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RecentJobContainerHs(item: jobs[index]),
            const SizedBox(height: 20),
          ],
        );
      },
    ),
  );
}
