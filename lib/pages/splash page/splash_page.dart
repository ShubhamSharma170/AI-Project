// ignore_for_file: use_build_context_synchronously

import 'package:ai_project/constant/size.dart';
import 'package:ai_project/custom/custom_loading_lottie.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/hive.dart';
import 'package:ai_project/pages/auth/login_page.dart';
import 'package:ai_project/pages/home/home_page.dart';
import 'package:ai_project/pages/onboard_page/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) =>
          //  Navigator.pushNamed(
          //   context,
          //   HiveHelper.showOnboard ? RoutesName.onboard : RoutesName.home,
          // ),
          Get.off(() => HiveHelper.showOnboard ? OnboardPage() : HiveHelper.isLogin?HomePage():LoginPage()),
    );
    // ).then((value) => Navigator.pushNamed(context, RoutesName.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: softCream,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 3),
            Image.asset("assets/images/ai.png", width: mq.width * .6),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
