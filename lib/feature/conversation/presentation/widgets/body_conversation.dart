import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tit_chat_bot/Prefs/prefs.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_bloc.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_event.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_state.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/widgets/suggestion.dart';
import 'package:tit_chat_bot/widgets/dialog/dialog.dart';

import 'bottom_mess.dart';
import 'history_message.dart';

class BodyConversation extends StatefulWidget {
  const BodyConversation({Key? key}) : super(key: key);

  @override
  _BodyConversationState createState() => _BodyConversationState();
}

class _BodyConversationState extends State<BodyConversation> {
  late final TextEditingController messageController;
  late String sender;
  late String message;
  late List<String> list;
  late ScrollController _controller;
  late bool isShowSugg;
  late int itemCount;
  late bool isLazyLoad;
  @override
  void initState() {
    messageController = TextEditingController();
    _controller = ScrollController()..addListener(_scrollListener);

    sender = "";
    message = "";
    isShowSugg = true;
    isLazyLoad = false;

    list = Prefs.getLocalListMessage();
    if (list.length >= 20) {
      itemCount = 20;
    } else {
      itemCount = list.length;
    }

    super.initState();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent &&
        list.length >= 20) {
      isLazyLoad = true;
      setState(() {});
      Timer(const Duration(milliseconds: 500), () {
        setState(() {});
        isLazyLoad = false;
        itemCount += 20;
        if (itemCount >= list.length) {
          itemCount = list.length;
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state is Empty) {
        isChat();
      } else if (state is ChatAlready) {
        Prefs.removeMessLoading(list);
        return buildBody();
      } else if (state is Loaded) {
        String appChat = state.data.first.text ?? "N/A";

        Map<String, dynamic> admin = {'name': 'admin', 'message': appChat};
        // check duplicate message on reload
        if (list.contains("messLoading")) {
          Prefs.saveLocalListMessage(list, admin: jsonEncode(admin));
          Prefs.removeMessLoading(list);
        }

        return buildBody();
      } else if (state is Loading) {
        Prefs.removeMessLoading(list);

        Map<String, dynamic> user = {'name': 'user', 'message': message};

        // check error message
        if (message.isNotEmpty) {
          Prefs.saveLocalListMessage(list,
              user: jsonEncode(user), messLoading: "messLoading");
        }

        message = "";

        return buildBody();
      } else if (state is Error) {
        // check no internet connection
        Map<String, dynamic> user = {'name': 'user', 'message': message};
        if (message.isNotEmpty) {
          Prefs.saveLocalListMessage(
            list,
            user: jsonEncode(user),
          );
        }

        Prefs.removeMessLoading(list);
        return buildBody();
      } else if (state is NotChat) {
        Prefs.removeMessLoading(list);

        // check error message
        if (Prefs.getLocalMessageUser() != "N/A" &&
            Prefs.getLocalMessageAdmin() == "N/A") {
          isShowSugg = false;
        }

        return buildBody(
          isShowSugg: isShowSugg,
        );
      }
      return Container();
    });
  }

  Widget buildBody({bool isShowSugg = false}) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                  width: size.width,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: HistoryMessage(
                      isLazyLoad: isLazyLoad,
                      itemCount: itemCount,
                      scrollController: _controller,
                    ),
                  )),
            ),
            isShowSugg == true ? suggestionList() : const SizedBox.shrink(),
            XBottomMessage(
              leftCallBack: () {},
              messageController: messageController,
              onChangeTextField: (value) {
                message = value;
              },
              onSubmitTextField: (value) {
                sendMessage();
              },
              rightCallBack: () {
                sendMessage();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget suggestionList() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Suggestion(
        label: "Xin chào",
        voidCallBack: () {
          message = "Xin Chào";
          chat();
          messageController.text = "";
        },
      ),
      Suggestion(
        label: "Công ty này tên gì?",
        voidCallBack: () {
          message = "Công ty này tên gì?";
          chat();
          messageController.text = "";
        },
      ),
    ]);
  }

  void sendMessage() {
    if (message.isNotEmpty) {
      chat();
    }
    // auto scroll to end list view
    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );

    messageController.text = "";
    setState(() {});
  }

  void chat() {
    BlocProvider.of<ChatBloc>(context).add(ChatE(sender, message, failure: () {
      ///để đảm bảo State tồn tại trước khi gọi setState ()
      if (mounted) {
        setState(() => maintenanceDialog(
            context: context,
            function: () {
              Navigator.pop(context);
            }));
      }
    }));
  }

  void isChat() {
    BlocProvider.of<ChatBloc>(context).add(IsChat());
  }

  void clear() {
    BlocProvider.of<ChatBloc>(context).add(ClearE());
  }
}
