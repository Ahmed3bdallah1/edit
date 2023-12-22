import 'package:flutter/material.dart';

import '../../../core/managers/navigation.dart';
import '../../user interface/messages/message_chat.dart';
import '../reusable_text.dart';

class ChatName extends StatefulWidget {
  final String imageName;
  final String title;
  final String time;
  final String description;

  const ChatName(
      {super.key,
      required this.imageName,
      required this.title,
      required this.description,
      required this.time});

  @override
  State<ChatName> createState() => _ChatNameState();
}

class _ChatNameState extends State<ChatName> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            customPageRouteTransition(ChatScreen(
              compName: widget.title,
              compImage: widget.imageName,
            )));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Image.asset(widget.imageName),
                const SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableAdjustedText(
                        message: widget.title,
                        size: 16,
                        fontWeight: FontWeight.bold),
                    ReusableAdjustedText(message: widget.description, size: 10),
                  ],
                ),
                const Spacer(),
                ReusableAdjustedText(
                    message: widget.time, size: 12, color: Colors.blueAccent)
              ],
            ),
          ),
          const Divider(color: Colors.black12, indent: 20, endIndent: 20)
        ],
      ),
    );
  }
}
