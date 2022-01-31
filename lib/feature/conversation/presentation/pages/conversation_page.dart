import 'package:flutter/material.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/widgets/body_conversation.dart';
import 'package:tit_chat_bot/widgets/app_bar/app_bar.dart';

class Conversation extends StatefulWidget {
  static const String routeName = "/Conversation";

  const Conversation({Key? key}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context,
          title: "Cuộc hội thoại",
          action: IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/Group.png"))),
      backgroundColor: Colors.white,
      body: const BodyConversation(),
    );
  }
}
