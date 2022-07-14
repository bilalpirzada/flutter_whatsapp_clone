import 'package:flutter/material.dart';

import '../CustomUI/ButtonCard.dart';
import '../CustomUI/ContactCard.dart';
import '../Model/ChatModel.dart';
import 'CreateGroup.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
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
        status: "Sharing is caring, ",
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

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 contacts",
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
            PopupMenuButton<String>(
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
