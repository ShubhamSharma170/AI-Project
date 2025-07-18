import 'package:ai_project/helper/colors.dart';
import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Bot")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
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
                onPressed: () {},
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
    );
  }
}
