import 'package:flutter/material.dart';

import '../reusable_text.dart';

class GeneralButton extends StatelessWidget {
  final String name;
  final String image;
  final String token;
  final Widget Function(BuildContext context) builder;

  const GeneralButton(
      {super.key,
        required this.builder,
        required this.name,
        required this.token,
        required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(child: Container(color: Colors.blueAccent.withOpacity(.3),child: Image.asset(image, width: 40))),
        const SizedBox(width: 15),
        ReusableAdjustedText(message: name, size: 16,fontWeight: FontWeight.w500,),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => builder(_)));
            },
            child: const Icon(Icons.arrow_forward_outlined))
      ],
    );
  }
}
