import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/message_widget/message_shap_rec.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';

class ChatScreen extends StatefulWidget {
  final String compName;
  final String compImage;

  const ChatScreen(
      {super.key, required this.compName, required this.compImage});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(widget.compImage),
            const SizedBox(width: 10),
            ReusableBigText(message: widget.compName),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.settings_suggest),
          )
        ],
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MessageShapeRec(
                  color: Colors.grey.withOpacity(.3),
                  message:
                      "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage."),
              MessageShapeRec(
                  color: Colors.blueAccent.withOpacity(.3),
                  message:
                      "Hi Melan, thank you for considering me, this is good news for me."),
              MessageShapeRec(
                  color: Colors.grey.withOpacity(.3),
                  message:
                      "Can we have an interview via google meet call today at 3pm?"),
              MessageShapeRec(
                  color: Colors.blueAccent.withOpacity(.3),
                  message: "Of course, I can!"),
              MessageShapeRec(
                  color: Colors.grey.withOpacity(.3),
                  message:
                      "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!"),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            hintText: "send a message",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
      ),
    );
  }
}
