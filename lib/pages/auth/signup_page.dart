import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/pages/features/firebase_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
            Container(
              height: mq.height * .3,
              decoration: BoxDecoration(color: white),
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
                    const Spacer(),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                    ),
                    const Spacer(),
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
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(white),
                        ),
                        onPressed: () {
                          FireBaseFeatures().signUP(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: black, fontSize: 20),
                        ),
                      ),
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
