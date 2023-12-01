import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';
import 'package:graduation_project/services/models/provider_models/jobs_services.dart';
import 'package:provider/provider.dart';

class WorkTypeContainer extends StatefulWidget {
  final String jobTitle;
  final int index;

  const WorkTypeContainer(
      {super.key, required this.index, required this.jobTitle});

  @override
  State<WorkTypeContainer> createState() => _WorkTypeContainerState();
}

class _WorkTypeContainerState extends State<WorkTypeContainer> {
  @override
  Widget build(BuildContext context) {
    // bool selected=context.watch<JobModels>().isContainerTapped;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Provider.of<JobModels>(context, listen: false)
            .workTypeTapped(widget.index);
      },
      child: Consumer<JobModels>(
        builder: (context, jobModels, _) {
          return Container(
              height: height*.12,
              width: width,
              decoration: BoxDecoration(
                  color: jobModels.workTypeTappedList[widget.index]
                      ? CupertinoColors.systemBlue.withOpacity(.4)
                      : CupertinoColors.white,
                  border: Border.all(
                      color: jobModels.workTypeTappedList[widget.index]
                          ? CupertinoColors.systemBlue
                          : CupertinoColors.opaqueSeparator,
                      style: BorderStyle.solid,
                      width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15),
                    child: Column(
                      children: [
                        ReusableAdjustedText(message: widget.jobTitle, size: 16),
                        const ReusableAdjustedText(
                          message: "CV.pdf - Portfolio.pdf",
                          size: 12,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: jobModels.workTypeTappedList[widget.index] == false
                        ? const Icon(CupertinoIcons.circle)
                        : const Icon(CupertinoIcons.check_mark_circled,color: CupertinoColors.systemBlue,),
                  )
                ],
              ));
        },
      ),
    );
  }
}
