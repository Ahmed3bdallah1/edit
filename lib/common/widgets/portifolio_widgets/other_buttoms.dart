import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';

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
        // ClipOval(child: Image.asset(image, width: 40)),
        // const SizedBox(width: 10),
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
