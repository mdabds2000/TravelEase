import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truck_ease/src/model/chat_model.dart';

class ChatController extends GetxController {
  var messages = <ChatModel>[].obs;
  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(
          ChatModel(message: messageController.text.trim(), isSentByMe: true));
      messageController.clear();
    }
  }

  void receiveMessage(String message) {
    messages.add(ChatModel(message: message, isSentByMe: false));
  }
}
