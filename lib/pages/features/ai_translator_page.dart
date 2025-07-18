import 'package:flutter/material.dart';

class AITranslatorPage extends StatefulWidget {
  const AITranslatorPage({super.key});

  @override
  State<AITranslatorPage> createState() => _AITranslatorPageState();
}

class _AITranslatorPageState extends State<AITranslatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("AI Translator")));
  }
}
