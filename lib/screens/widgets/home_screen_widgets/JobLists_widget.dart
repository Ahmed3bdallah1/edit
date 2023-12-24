import 'package:flutter/material.dart';
import 'package:graduation_project/screens/widgets/home_screen_widgets/recent_jobs_sections.dart';
import 'package:graduation_project/screens/widgets/home_screen_widgets/suggested_Jobs_Section_Widget.dart';

SliverList buildJobLists(double height, jobsFuture) {
  return SliverList(
    delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            buildSuggestedJobsSection(jobsFuture),
            buildRecentJobsSection(height, jobsFuture),
            // Add more list items or widgets here
          ],
        ),
      )
    ]),
  );
}
