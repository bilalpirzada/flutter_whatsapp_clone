import 'package:flutter/material.dart';

import '../Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            // contact.select
            //     ? Positioned(
            //         bottom: 4,
            //         right: 5,
            //         child: CircleAvatar(
            //           backgroundColor: Colors.teal,
            //           radius: 11,
            //           child: Icon(
            //             Icons.check,
            //             color: Colors.white,
            //             size: 18,
            //           ),
            //         ),
            //       )
            //     : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
