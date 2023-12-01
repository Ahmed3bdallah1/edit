import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';

class Switcher extends StatefulWidget {
  final String name;

  const Switcher({super.key, required this.name});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 0.1, // Border width
        ),
        // borderRadius: BorderRadius.circular(8), // Border radius
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ReusableAdjustedText(
                message: widget.name,
                size: 14,
                fontWeight: FontWeight.w400,
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
