//create group selected avatar in the horizantal listView

import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Model/ChatModel.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({Key? key, required this.contact}) : super(key: key);
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            
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
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
