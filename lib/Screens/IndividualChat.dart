import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Model/ChatModel.dart';

class IndividualChatPage extends StatefulWidget {
  const IndividualChatPage({Key? key, required this.chatModel})
      : super(key: key);

  final ChatModel chatModel;

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      titleSpacing: 0,
      leadingWidth: 80,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          CircleAvatar(
            child: Icon(
              widget.chatModel.isGroup ? Icons.groups : Icons.person,
              color: Colors.white,
              size: 30.0,
            ),
            radius: 20,
            backgroundColor: Colors.blueGrey,
          )
        ],
      ),
      title: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.chatModel.name,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
            ),
            Text(
              "last seen today at 11:00 AM",
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        PopupMenuButton<String>(
          onSelected: (value) {
            print(value);
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text("View Contact"),
                value: "View Contact",
              ),
              PopupMenuItem(
                child: Text("Media, links and docs"),
                value: "Media, links and docs",
              ),
              PopupMenuItem(
                child: Text("Search"),
                value: "Search",
              ),
              PopupMenuItem(
                child: Text("Mute Notification"),
                value: "Mute Notification",
              ),
              PopupMenuItem(
                child: Text("Wallpaper"),
                value: "Wallpaper",
              ),
            ];
          },
        )
      ],
    ));
  }
}
