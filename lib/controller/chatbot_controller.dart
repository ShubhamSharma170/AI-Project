import 'package:ai_project/model/message.dart';
import 'package:ai_project/network_manager/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotController extends GetxController {
  final cText = TextEditingController();
  final scrollController = ScrollController();

  final list = <Message>[
    Message(message: "Hello, how can I help you?", msgType: MessageType.bot),
  ].obs;

  Future<void> sendMag(String qus) async {
    if (cText.text.trim().isNotEmpty) {
      // user
      list.add(Message(message: qus, msgType: MessageType.user));
      cText.text = "";
      list.add(Message(message: "", msgType: MessageType.bot));
      scrollDown();

      final ans = await RestClient.getChatBotData(qus);
      // log("ANSWER: ${ans.choices![0].message!.content}");

      list.removeLast();

      // bot
      list.add(
        Message(
          message: ans.choices![0].message?.content ?? "No answer",
          msgType: MessageType.bot,
        ),
      );
      scrollDown();
    }
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
