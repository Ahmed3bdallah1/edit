import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/widgets/reusable_text.dart';
import 'package:provider/provider.dart';
import '../../models/models/provider_models/jobs_services.dart';

class JobBubble extends StatefulWidget {
  final IconData? icon;
  final String jobTitle;
  final int index;

  const JobBubble(
      {super.key,
      required this.index,
      required this.icon,
      required this.jobTitle});

  @override
  State<JobBubble> createState() => _JobBubbleState();
}

class _JobBubbleState extends State<JobBubble> {
  @override
  Widget build(BuildContext context) {
    // bool selected=context.watch<JobModels>().isContainerTapped;
    return InkWell(
      onTap: () {
        print("object");
        Provider.of<JobModels>(context, listen: false)
            .containerTapped(widget.index);
        int counter=Provider.of<JobModels>(context,listen: false).counter;
        print(counter);
      },
      child: Consumer<JobModels>(
        builder: (context, jobModels, _) {
          return Container(
            height: 120,
            width: 150,
            decoration: BoxDecoration(
                color: jobModels.containerTappedList[widget.index]
                    ? CupertinoColors.systemBlue.withOpacity(.4)
                    : CupertinoColors.white,
                border: Border.all(
                    color: jobModels.containerTappedList[widget.index]
                        ? CupertinoColors.systemBlue
                        : CupertinoColors.opaqueSeparator,
                    style: BorderStyle.solid,
                    width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Positioned(
                    top: 15,
                    left: 15,
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            border: Border.all(
                                color: jobModels.containerTappedList[widget.index]?CupertinoColors.systemBlue:CupertinoColors.opaqueSeparator,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(widget.icon,
                            color: jobModels.containerTappedList[widget.index]
                                ? CupertinoColors.systemBlue.withOpacity(.6)
                                : CupertinoColors.black))),
                Positioned(
                    bottom: 5,
                    left: 10,
                    child: ReusableAdjustedText(message: widget.jobTitle, size: 15,fontWeight: FontWeight.bold,))
              ],
            ),
          );
        },
      ),
    );
  }
}
