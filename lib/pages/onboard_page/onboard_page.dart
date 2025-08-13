import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/hive.dart';
import 'package:ai_project/helper/text_style.dart';
import 'package:ai_project/model/onboard_model.dart';
import 'package:ai_project/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ai_project/constant/size.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final list = [
    OnboardModel(
      lottie: "assets/lottie/onboard1.json",
      title: "Ask Me Anything",
      subtitle:
          "I can be your best friend and you can ask \n me anything and  I will answer you.",
    ),
    OnboardModel(
      lottie: "assets/lottie/onboard2.json",
      title: "Ask Me Anything",
      subtitle:
          "I can be your best friend and you can ask \n me anything and  I will answer you.",
    ),
  ];

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (ctx, index) => Column(
          children: [
            Spacer(flex: 4),
            Lottie.asset(list[index].lottie),
            Text(
              list[index].title,
              style: TextStyleHelper.textStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              list[index].subtitle,
              style: TextStyleHelper.textStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Spacer(),
            Wrap(
              spacing: 10,
              children: List.generate(
                list.length,
                (i) => Container(
                  height: 10,
                  width: i == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: i == index ? purple9555E3 : grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: purple9555E3,
                shape: StadiumBorder(),
                minimumSize: Size(mq.width * .4, 50),
              ),
              child: Text(
                index == list.length - 1 ? "Finish" : "Next",
                style: TextStyleHelper.textStyle(
                  color: white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                if (index == list.length - 1) {
                  HiveHelper.showOnboard = false;
                  // Navigator.pushNamed(context, RoutesName.home);
                  Get.off(() => LoginPage());
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                  );
                }
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
