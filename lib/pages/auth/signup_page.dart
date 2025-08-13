import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/pages/features/firebase_features.dart';
import 'package:ai_project/widget/loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mq = MediaQuery.of(context).size;
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,}$",
    );
    return emailRegExp.hasMatch(email);
  }

  final firebaseController = Get.find<FireBaseFeatures>();

  @override
  Widget build(BuildContext context) {
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
                      "Sign Up",
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
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Confirm Password",
                      ),
                    ),
                    const Spacer(flex: 7),
                    SizedBox(
                      width: mq.width * .5,
                      child: Obx(() {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(white),
                          ),
                          onPressed: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              Get.snackbar(
                                "",
                                titleText: Text(
                                  "Error",
                                  style: TextStyle(color: white),
                                ),
                                "",
                                messageText: Text(
                                  "Please fill all the fields",
                                  style: TextStyle(color: white),
                                ),
                                backgroundColor: red,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else if (!isValidEmail(
                              emailController.text.trim(),
                            )) {
                              Get.snackbar(
                                "",
                                titleText: Text(
                                  "Error",
                                  style: TextStyle(color: white),
                                ),
                                "",
                                messageText: Text(
                                  "Please enter a valid email",
                                  style: TextStyle(color: white),
                                ),
                                backgroundColor: red,
                              );
                            } else if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              Get.snackbar(
                                "",
                                titleText: Text(
                                  "Error",
                                  style: TextStyle(color: white),
                                ),
                                "",
                                messageText: Text(
                                  "Password and Confirm Password do not match",
                                  style: TextStyle(color: white),
                                ),
                                backgroundColor: red,
                              );
                            } else if (passwordController.text.trim().length <
                                7) {
                              Get.snackbar(
                                "Error",
                                "Password must be at least 7 characters",
                                backgroundColor: red,
                              );
                            } else {
                              firebaseController.isLoading.value
                                  ? null
                                  : firebaseController
                                        .signUP(
                                          emailController.text.trim(),
                                          passwordController.text.trim(),
                                        )
                                        .then((value) {
                                          if (value) {
                                            emailController.clear();
                                            passwordController.clear();
                                            confirmPasswordController.clear();
                                            Get.snackbar(
                                              "",
                                              titleText: Text(
                                                "Success",
                                                style: TextStyle(color: white),
                                              ),
                                              "",
                                              messageText: Text(
                                                "User Created Successfully",
                                                style: TextStyle(color: white),
                                              ),
                                              backgroundColor: green,
                                            );
                                          }
                                        });
                            }
                          },
                          child: firebaseController.isLoading.value
                              ? SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: customCircularProgress(black),
                                )
                              : Text(
                                  "Sign Up",
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
                          "Already have an account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Login",
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
