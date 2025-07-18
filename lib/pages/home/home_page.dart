import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/model/home_type.dart';
import 'package:ai_project/network_manager/rest_client.dart';
import 'package:ai_project/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    super.initState();
    _setImmersiveMode(); // call your async method
  }

  Future<void> _setImmersiveMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ai Assistant"),
        actions: [
          IconButton(
            onPressed: () {
              RestClient.getChatBotData("What is GTA5");
            },
            icon: Icon(Icons.brightness_4_outlined, color: black, size: 25),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .05,
          vertical: mq.height * .02,
        ),
        child: ListView(
          children: HomeType.values
              .map((e) => CardWidget(homeType: e))
              .toList(),
        ),
      ),
    );
  }
}
