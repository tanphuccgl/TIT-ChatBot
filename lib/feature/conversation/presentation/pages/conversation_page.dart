import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tit_chat_bot/core/config/injection_container.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_bloc.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/widgets/body_conversation.dart';
import 'package:tit_chat_bot/test.dart';

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
       backgroundColor: Colors.white,

      body: buildBody(context),
    );
  }

  BlocProvider<ChatBloc> buildBody(BuildContext context) {
    return BlocProvider(create: (_) => sl<ChatBloc>(), child: BodyConversation());
  }
}
