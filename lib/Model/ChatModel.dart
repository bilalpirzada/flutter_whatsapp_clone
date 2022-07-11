import 'package:flutter/material.dart';

class ChatModel {
  String name;
  Icon icon;
  bool isGroup;
  String time;
  String currentMessage;

  ChatModel(
      {required this.currentMessage,
      required this.name,
      required this.icon,
      required this.isGroup,
      required this.time});
}

class ContactModel {
  String name;
  String status;
  ContactModel({required this.name, required this.status});
}
