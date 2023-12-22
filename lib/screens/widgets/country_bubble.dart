import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models/provider_models/jobs_services.dart';

class CountryBubble extends StatefulWidget {
  String name;
  String photoAssetRoute;
  final int index;

  CountryBubble(
      {super.key,
      required this.name,
      required this.photoAssetRoute,
      required this.index});

  @override
  State<CountryBubble> createState() => _CountryBubbleState();
}

class _CountryBubbleState extends State<CountryBubble> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<JobModels>(context, listen: false)
            .containerTappedCountry(widget.index);
        int counter =
            Provider.of<JobModels>(context, listen: false).countryCounter;
        print(counter);
      },
      child: Consumer<JobModels>(
        builder: (context, jobModels, _) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: jobModels.containerTappedListCounty[widget.index]
                  ? CupertinoColors.systemBlue.withOpacity(.4)
                  : CupertinoColors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                  color: jobModels.containerTappedListCounty[widget.index]
                      ? CupertinoColors.systemBlue
                      : CupertinoColors.opaqueSeparator,
                  style: BorderStyle.solid,
                  width: 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.photoAssetRoute),
                const SizedBox(width: 5),
                Text(widget.name, style: const TextStyle(fontSize: 15)),
              ],
            ),
          );
        },
      ),
    );
  }
}
