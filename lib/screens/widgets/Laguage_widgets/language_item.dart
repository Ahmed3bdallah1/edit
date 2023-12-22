import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../reusable_text.dart';

class LanguageItem extends StatefulWidget {
  final String name;

  const LanguageItem({super.key, required this.name});

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  late bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: CupertinoColors.black,
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              Image.asset("assets/language_country/${widget.name}.png"),
              const SizedBox(width: 20),
              ReusableAdjustedText(
                message: widget.name,
                size: 16,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = true;
                    if (isSelected == true) {
                      isSelected = !isSelected;
                    }
                  });
                },
                child: isSelected == false
                    ? const Icon(CupertinoIcons.circle)
                    : const Icon(
                        CupertinoIcons.circle_fill,
                        color: Colors.blue,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
