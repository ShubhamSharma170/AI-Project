class Message {
  String message;
  final MessageType msgType;

  Message({required this.message, required this.msgType});
}

enum MessageType { user, bot }
