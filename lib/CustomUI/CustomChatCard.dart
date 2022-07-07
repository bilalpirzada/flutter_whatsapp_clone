import 'package:flutter/material.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Icon(
              Icons.groups,
              color: Colors.white,
              size: 37.0,
            ),
            backgroundColor: Colors.blueGrey),
        trailing: Text("10:00 PM"),
        title: Text(
          "Muhammad Bilal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Row(children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            "Hi I am Bilal",
            style: TextStyle(fontSize: 13),
          )
        ]),
      ),
    );
  }
}
