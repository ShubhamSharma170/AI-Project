import 'package:ai_project/helper/colors.dart';
import 'package:flutter/material.dart';

class ImageGeneratorPage extends StatefulWidget {
  const ImageGeneratorPage({super.key});

  @override
  State<ImageGeneratorPage> createState() => _ImageGeneratorPageState();
}

class _ImageGeneratorPageState extends State<ImageGeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowffd048,
      appBar: AppBar(title: const Text("Image Generator")),
    );
  }
}
