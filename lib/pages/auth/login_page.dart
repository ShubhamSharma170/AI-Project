import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/hive.dart';
import 'package:ai_project/pages/auth/signup_page.dart';
import 'package:ai_project/pages/features/firebase_features.dart';
import 'package:ai_project/pages/home/home_page.dart';
import 'package:ai_project/widget/loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mq = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final firebaseController = Get.find<FireBaseFeatures>();

    bool isValidEmail(String email) {
      final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,}$",
      );
      return emailRegExp.hasMatch(email);
    }

    return Scaffold(
      backgroundColor: yellowffd048,
      // appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            Container(
              height: mq.height * .3,
              decoration: BoxDecoration(color: yellowffd048),
              child: Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: softCream,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                    ),
                    const Spacer(flex: 2),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                    ),
                    const Spacer(flex: 2),
                    SizedBox(
                      width: mq.width * .5,
                      child: Obx(() {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(white),
                          ),
                          onPressed: firebaseController.isLoading.value
                              ? null
                              : () {
                                  if (emailController.text.trim().isEmpty ||
                                      passwordController.text.trim().isEmpty) {
                                    Get.snackbar(
                                      "Error",
                                      "Please enter email and password",
                                      backgroundColor: red,
                                    );
                                  } else if (passwordController.text
                                          .trim()
                                          .length <
                                      7) {
                                    Get.snackbar(
                                      "Error",
                                      "Password must be at least 7 characters",
                                      backgroundColor: red,
                                    );
                                  } else if (!isValidEmail(
                                    emailController.text.trim(),
                                  )) {
                                    Get.snackbar(
                                      "Error",
                                      "Please enter valid email",
                                      backgroundColor: red,
                                    );
                                  } else {
                                    firebaseController
                                        .signIn(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        )
                                        .then((value) {
                                          if (value) {
                                            emailController.clear();
                                            passwordController.clear();
                                            HiveHelper.setLogin = true;
                                            Get.off(HomePage());
                                          }
                                        });
                                  }
                                },
                          child: firebaseController.isLoading.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: customCircularProgress(black),
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(color: black, fontSize: 20),
                                ),
                        );
                      }),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
