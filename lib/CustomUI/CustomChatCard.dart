import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Model/ChatModel.dart';
import 'package:flutter_whatsapp_clone/Screens/IndividualChat.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return IndividualChatPage();
        })));
      },
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Icon(
              chatModel.isGroup ? Icons.groups : Icons.person,
              color: Colors.white,
              size: 37.0,
            ),
            backgroundColor: Colors.blueGrey),
        trailing: Text(chatModel.time),
        title: Text(
          chatModel.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Row(children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            chatModel.currentMessage,
            style: TextStyle(fontSize: 13),
          )
        ]),
      ),
    );
  }
}
