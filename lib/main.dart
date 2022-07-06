import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Screens/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          accentColor: Color(0xFF128C7E),
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 7, 94, 84),
          )),
      home: HomeScreen(),
    );
  }
}
