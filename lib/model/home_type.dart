enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  // title
  String get title => switch (this) {
    HomeType.aiChatBot => "AI ChatBot",
    HomeType.aiImage => "AI Image Generator",
    HomeType.aiTranslator => "AI Translator",
  };
  // lottie
  String get lottie => switch (this) {
    HomeType.aiChatBot => "assets/lottie/ai_hand_waving.json",
    HomeType.aiImage => "assets/lottie/ai_play.json",
    HomeType.aiTranslator => "assets/lottie/ai_ask_me.json",
  };

  // for alignment
  bool get alignment => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
  };
}
