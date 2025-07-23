import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/text_style.dart';
import 'package:ai_project/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return message.msgType == MessageType.bot
        ? Row(
            children: [
              CircleAvatar(
                backgroundColor: white,
                radius: 20,
                child: Image.asset("assets/images/ai.png", width: 35),
              ),
              SizedBox(width: 10),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child:
                    message.message.isEmpty?
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Please wait...",
                          textStyle: TextStyleHelper.textStyle(
                            color: black,
                            fontSize: 18,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever: true,
                    ):
                     Text(
                      message.message,
                      style: TextStyleHelper.textStyle(color: black, fontSize: 18),
                    ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .7),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Text(
                  // textAlign: TextAlign.center,
                  message.message,
                  style: TextStyleHelper.textStyle(color: black, fontSize: 18),
                ),
              ),
              CircleAvatar(
                backgroundColor: white,
                radius: 20,
                child: Icon(
                  Icons.person_4_rounded,
                  color: blue00C2FF,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
            ],
          );
  }
}
