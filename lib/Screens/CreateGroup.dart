import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/CustomUI/ContactAvatar.dart';

import '../CustomUI/ButtonCard.dart';
import '../CustomUI/ContactCard.dart';
import '../Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ContactModel> contacts = [
    ContactModel(
      name: "Abdullah",
      status: "A full stack developer",
      select: false,
    ),
    ContactModel(
      name: "Bilal",
      status: "Flutter Developer...........",
      select: false,
    ),
    ContactModel(
      name: "China Wala",
      status: "Web developer...",
      select: false,
    ),
    ContactModel(
      name: "Dholu",
      status: "App developer....",
      select: false,
    ),
    ContactModel(
      name: "Emran",
      status: "Raect developer..",
      select: false,
    ),
    ContactModel(
      name: "Farukh",
      status: "Full Stack Web",
      select: false,
    ),
    ContactModel(
      name: "Ghias",
      status: "Example work",
      select: false,
    ),
    ContactModel(
      name: "Haider",
      status: "Sharing is caring, select: false,",
      select: false,
    ),
    ContactModel(
      name: "Inam",
      status: ".....",
      select: false,
    ),
    ContactModel(
      name: "Kareem",
      status: "Love you Mom Dad",
      select: false,
    ),
    ContactModel(
      name: "Lahore wala",
      status: "I find the bugs",
      select: false,
    ),
  ];

  List<ContactModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length+1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0 ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      if (contacts[index - 1].select == false) {
                        setState(() {
                          contacts[index - 1].select = true;
                          groups.add(contacts[index]);
                        });
                      } else {
                        setState(() {
                          contacts[index - 1].select = false;
                          groups.remove(contacts[index]);
                        });
                      }
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: ((context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: ContactAvatar(
                                    contact: contacts[index],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            })),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
