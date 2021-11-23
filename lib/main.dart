import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/pages/conversation_page.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';
import 'package:tit_chat_bot/feature/opening/presentation/pages/opening_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        PageRoutes.homePage: (context) => HomePage(),
        PageRoutes.openingPage: (context) => OpeningPage(),
        PageRoutes.conversation: (context) => Conversation(),


      },
    );
  }
}

