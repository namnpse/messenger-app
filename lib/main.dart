import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(MessgenerApp());
}

class MessgenerApp extends StatelessWidget {
  const MessgenerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ConversationPage(),
      home: HomePage(),
    );
  }
}

