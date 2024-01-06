import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
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
            return buildSuggestedJobsList2(snapshot.data!);
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
Widget buildSuggestedJobsList2(List<Map<String, dynamic>> jobs) {
  return SizedBox(
    height: 220,
    child: CardSwiper(
      padding: const EdgeInsets.symmetric(vertical: 20),
      cardBuilder: (
          context,
          index,
          horizontalOffsetPercentage,
          verticalOffsetPercentage,
          ) {
        final cardDetail = jobs[index];
        return GestureDetector(
          child: SuggestedJobContainerHS(item: cardDetail),
        );
      },
      cardsCount: jobs.length,
      numberOfCardsDisplayed: 3,
      scale: 0.95,
      backCardOffset: const Offset(18, -15),
    ),
  );
}
