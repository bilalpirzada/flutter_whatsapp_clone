import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/CustomUI/CustomChatCard.dart';
import 'package:flutter_whatsapp_clone/Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        currentMessage: "I am Bilal",
        name: "Muhammad Bilal",
        icon: Icon(Icons.person),
        isGroup: false,
        time: "5:00 PM"),
    ChatModel(
        currentMessage: "New Group for study",
        name: " Study Group",
        icon: Icon(Icons.groups),
        isGroup: true,
        time: "3:00 PM"),
    ChatModel(
        currentMessage: "Any Update?",
        name: "Abdullah",
        icon: Icon(Icons.person),
        isGroup: false,
        time: "13:00 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: ((context, index) {
            return CustomChatCard(chatModel: chats[index]);
          })),
    );
  }
}
