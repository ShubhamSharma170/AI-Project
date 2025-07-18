import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/text_style.dart';
import 'package:ai_project/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class CardWidget extends StatelessWidget {
  final HomeType homeType;
  const CardWidget({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: homeType.onTap,
        child: Card(
          color: blue00C2FF.withAlpha(400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: homeType.alignment
                ? Row(
                    children: [
                      SizedBox(
                        width: mq.width * .3,
                        child: Lottie.asset(homeType.lottie),
                      ),
                      Spacer(),
                      Text(
                        homeType.title,
                        style: TextStyleHelper.textStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  )
                : Row(
                    children: [
                      Spacer(flex: 2),
                      Text(
                        homeType.title,
                        style: TextStyleHelper.textStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: mq.width * .3,
                        child: Lottie.asset(homeType.lottie),
                      ),
                    ],
                  ),
          ),
        ).animate().fade(duration: 1.seconds).scale(),
      ),
    );
  }
}
