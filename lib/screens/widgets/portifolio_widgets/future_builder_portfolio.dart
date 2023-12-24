import 'package:flutter/material.dart';
import '../reusable_text.dart';

Widget futureBuilder(appliedData) {
  return FutureBuilder<List<dynamic>>(
    future: appliedData,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(
            child: Column(
          children: [
            Text('No portfolio yet.'),
          ],
        ));
      } else {
        return listView(snapshot.data);
      }
    },
  );
}

Widget listView(List<dynamic>? portfolio) {
  return ListView.builder(
    itemCount: portfolio!.length,
    itemBuilder: (context, index) {
      var item = portfolio[index];
      print(item);
      return Row(
        children: [
          ClipRRect(child: Image.network(item["image"])),
          Column(
            children: [
              ReusableAdjustedText(
                  message: item["name"], size: 12, fontWeight: FontWeight.bold),
              ReusableAdjustedText(
                  message: item["cv_file"], size: 10, color: Colors.grey)
            ],
          )
        ],
      );
    },
  );
}
