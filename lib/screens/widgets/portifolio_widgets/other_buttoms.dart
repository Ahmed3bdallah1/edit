import 'package:flutter/material.dart';

import '../reusable_text.dart';

class OtherButton extends StatelessWidget {
  final String name;
  final String token;
  final Widget Function(String token) builder;

  const OtherButton(
      {super.key,
      required this.builder,
      required this.name,
      required this.token,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ReusableAdjustedText(message: name, size: 14,fontWeight: FontWeight.w500,),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => builder(token)));
            },
            child: const Icon(Icons.arrow_forward_outlined,size: 20,))
      ],
    );
  }
}
