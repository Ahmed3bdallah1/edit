import 'package:flutter/material.dart';

import '../../../core/managers/managers.dart';

SliverAppBar buildSliverAppBar(TextEditingController searchController) {
  return SliverAppBar(
    expandedHeight: 140,
    pinned: true,
    title: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(children: [
        Text("Hi, $generalName👋", style: const TextStyle(fontSize: 18))
      ]),
      const Row(children: [
        Text('Create a better future for yourself here',
            style: TextStyle(fontSize: 12))
      ]),
    ]),
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
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
  );
}
