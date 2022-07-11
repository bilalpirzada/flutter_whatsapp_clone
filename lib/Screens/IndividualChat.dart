import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
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
  bool _showEmoji = false;
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin:
                                EdgeInsets.only(left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: _focusNode,
                              maxLines: 5,
                              minLines: 1,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _focusNode.unfocus();
                                          _focusNode.canRequestFocus = false;
                                          _showEmoji = !_showEmoji;
                                        });
                                      },
                                      icon: Icon(Icons.emoji_emotions)),
                                  hintText: "Type a message...",
                                  suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.attach_file)),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera_alt),
                                        )
                                      ]),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(bottom: 8, right: 3, left: 3),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF128C7E),
                              radius: 25,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  )),
                            )),
                      ],
                    ),
                    //------------Emoji Container--------------
                    _showEmoji ? emojiSelect() : Container(),
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (_showEmoji) {
              setState(() {
                _showEmoji = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: EmojiPicker(
        onEmojiSelected: (emoji, category) {
          _controller.text = _controller.text + category.emoji;
        },
      ),
    );
  }
}
