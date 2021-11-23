import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/appbar_cus.dart';

class Conversation extends StatefulWidget {
  static const String routeName = "/Conversation";

  const Conversation({Key? key}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(
          context: context,
          title: "Cuộc hội thoại",
          action: IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/Group.png"))),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(),
      ),
    );
  }
}
