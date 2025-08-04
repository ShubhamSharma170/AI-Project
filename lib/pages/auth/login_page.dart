import 'package:ai_project/constant/size.dart';
import 'package:ai_project/helper/colors.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: white,
      // appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [
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
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                    ),
                    const Spacer(flex: 2),
                    SizedBox(
                      width: mq.width * .5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(white),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(color: black, fontSize: 20),
                        ),
                      ),
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
                          onPressed: () {},
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
            Container(
              height: mq.height * .2,
              decoration: BoxDecoration(color: white),
            ),
          ],
        ),
      ),
    );
  }
}
