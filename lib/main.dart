import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/pages/conversation_page.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';
import 'package:tit_chat_bot/feature/opening/presentation/pages/opening_page.dart';
import 'package:tit_chat_bot/test.dart';
import 'Prefs/prefs.dart';
import 'core/config/injection_container.dart' as di;
import 'core/config/injection_container.dart';
import 'feature/conversation/presentation/manager/chat/chat_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Prefs.init();

  await di.init();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

SharedPreferences? prefs;
ChatData? appChat;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ChatBloc>()),
      ],
      child: MaterialApp(
        title: 'TIT CHATBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
        ),
        home: const OpeningPage(),
        routes: {
          PageRoutes.homePage: (context) => const HomePage(),
          PageRoutes.openingPage: (context) => const OpeningPage(),
          PageRoutes.conversation: (context) => const Conversation(),
          PageRoutes.aa: (context) => const AA(),
        },
      ),
    );
  }
}
