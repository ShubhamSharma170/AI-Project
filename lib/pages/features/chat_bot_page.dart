import 'package:ai_project/controller/chatbot_controller.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final c = ChatbotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softCream,
      appBar: AppBar(title: const Text("Chat Bot")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: c.cText,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: softCream,
                  filled: true,
                  hintText: "Ask me anything you want...",
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: blue00C2FF,
              radius: 25,
              child: IconButton(
                onPressed: () => c.sendMag(c.cText.text.trim()),
                icon: Icon(
                  Icons.rocket_launch_outlined,
                  color: white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          controller: c.scrollController,
          physics: BouncingScrollPhysics(),
          children: c.list
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MessageCard(message: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
