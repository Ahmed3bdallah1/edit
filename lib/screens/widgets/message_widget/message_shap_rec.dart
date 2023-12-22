import 'package:flutter/material.dart';

import '../reusable_text.dart';

class MessageShapeRec extends StatelessWidget {
  final Color color;
  final String message;

  const MessageShapeRec(
      {super.key, required this.color, required this.message});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var alignment = (color == Colors.blueAccent.withOpacity(.3))
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width * .5,
          alignment: alignment,
          decoration: BoxDecoration(
              color: color,
              borderRadius: color == Colors.blueAccent.withOpacity(.3)
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
                child: ReusableAdjustedText(
              message: message,
              size: 10,
              fontWeight: FontWeight.w400,
            )),
          ),
        ),
      ),
    );
  }
}
