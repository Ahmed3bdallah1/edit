import 'package:flutter/material.dart';
import 'package:graduation_project/screens/widgets/home_screen_widgets/suggested_job_container.dart';

import '../reusable_text.dart';

Widget buildSuggestedJobsSection(jobsFuture) {
  return Column(
    children: [
      buildSectionHeader("Suggested Jobs", "View all"),
      FutureBuilder<List<Map<String, dynamic>>?>(
        future: jobsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            return buildSuggestedJobsList(snapshot.data!);
          } else {
            return const Center(child: Text("Error in getting data"));
          }
        },
      ),
    ],
  );
}

Widget buildSectionHeader(String title, String actionText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ReusableAdjustedText(message: title, size: 18),
      GestureDetector(
        onTap: () {},
        child: ReusableAdjustedText(
          message: actionText,
          size: 14,
          color: Colors.blueAccent,
        ),
      ),
    ],
  );
}

Widget buildSuggestedJobsList(List<Map<String, dynamic>> jobs) {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SuggestedJobContainerHS(item: jobs[index]),
            const SizedBox(width: 20),
          ],
        );
      },
    ),
  );
}
