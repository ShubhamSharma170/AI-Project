// ignore_for_file: use_build_context_synchronously

import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/routes/route_name/route_name.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => Navigator.pushNamed(context, RoutesName.home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mp = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: softCream,
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/ai.png", width: mp.width * .6),
          ),
        ),
      ),
    );
  }
}
