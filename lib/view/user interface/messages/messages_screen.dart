import 'package:flutter/material.dart';
import 'package:graduation_project/common/widgets/message_widget/chat_name.dart';
import 'package:graduation_project/common/widgets/reusable_text.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const ReusableBigText(message: "Messages"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  ChatName(
                      imageName: "assets/chats/twitter_logo.png",
                      title: "Twitter",
                      description: "Here is the link: http://zoom.com/abcdeefg",
                      time: "19-59"),
                  ChatName(
                      imageName: "assets/chats/dana_logo.png",
                      title: "Dana",
                      description: "Thank you for your attention!",
                      time: "19-59"),
                  ChatName(
                      imageName: "assets/chats/gojek_logo.png",
                      title: "Gojek Indonesia",
                      description: "Let’s keep in touch.",
                      time: "19-59"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
