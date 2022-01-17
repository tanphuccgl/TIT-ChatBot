import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/pages/conversation_page.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';
import 'package:tit_chat_bot/feature/opening/presentation/pages/opening_page.dart';
import 'package:tit_chat_bot/test.dart';
import 'core/config/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}
SharedPreferences? prefs;
ChatData? appChat;

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
      home:   const OpeningPage(),
      routes: {
        PageRoutes.homePage: (context) => const HomePage(),
        PageRoutes.openingPage: (context) => const OpeningPage(),
        PageRoutes.conversation: (context) =>  const Conversation(),
        PageRoutes.aa: (context) => AA(),


      },
    );
  }
}

