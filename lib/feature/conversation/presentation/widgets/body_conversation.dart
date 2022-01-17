import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tit_chat_bot/core/utils/appbar_cus.dart';
import 'package:tit_chat_bot/core/utils/card_chat_widget.dart';
import 'package:tit_chat_bot/core/utils/device_info.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/core/utils/spinkit.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_bloc.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_event.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_state.dart';
import 'package:tit_chat_bot/main.dart';

class Message {
  String? message;
  String? name;

  Message({this.message, this.name});
}

class BodyConversation extends StatefulWidget {
  const BodyConversation({Key? key}) : super(key: key);

  @override
  _BodyConversationState createState() => _BodyConversationState();
}

class _BodyConversationState extends State<BodyConversation> {
  TextEditingController? messageController;
  ScrollController? _controller;
  String? sender;
  String? message;
  List<String>? list;
  GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();

    _formKey = GlobalKey<FormState>();
    sender = "";
    message = "";
    if (prefs!.getStringList("list") != null) {
      list = prefs!.getStringList("list");
    } else {
      list = [];
    }
    setState(() {
      messageController = TextEditingController();
    });

    super.initState();

    /// clear cache
    //   prefs?.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      if (state is Empty) {

        isChat();
      } else if (state is ChatAlready) {
        prefs!.getStringList("list");

        return _buildBody();
      } else if (state is Loaded) {
        prefs!.getStringList("list");


        appChat = state.data.first;

        Map<String, dynamic> user = {'name': 'user', 'message': '$message'};
        prefs?.setString('user', jsonEncode(user));

        list?.add(prefs!.getString('user')!);
        prefs?.setStringList("list", list!);

        Map<String, dynamic> admin = {
          'name': 'admin',
          'message': appChat!.text!
        };
        prefs?.setString('admin', jsonEncode(admin));
        list?.add(prefs!.getString('admin')!);
        prefs?.setStringList("list", list!);
        return _buildBody();
      } else if (state is Loading) {

        return _buildBody();
      } else if (state is Error) {
        return Container();
      } else if (state is NotChat) {
        prefs?.setStringList("list", list!);

        if (message!.length > 0) {
          Map<String, dynamic> user = {'name': 'user', 'message': '$message'};
          prefs?.setString('user', jsonEncode(user));

          list?.add(prefs!.getString('user')!);
          prefs?.setStringList("list", list!);
        }
        return _buildBody(chatNew: true);
      }
      return Container();
    });
  }

  Widget _listChat() {
    Size size = MediaQuery.of(context).size;
    List list;
    if (prefs!.getStringList("list") != null) {
      list = prefs!.getStringList("list")!.reversed.toList();
    } else {
      list = [];
    }

    return ListView.builder(
        controller: _controller,
        reverse: true,
        itemBuilder: (context, index) {
          return jsonDecode(list[index]) != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /// avatar icon
                    jsonDecode(list[index])["name"] == "user"
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.only(
                                left: size.width / 60, bottom: size.width / 50),
                            child: SizedBox(
                              width: size.width / 10,
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/icons/Group (1).png"),
                              ),
                            ),
                          ),

                    ///card
                    SizedBox(
                      width: jsonDecode(list[index])["name"] == "user"
                          ? size.width
                          : size.width / 1.15,
                      child: Align(
                        alignment: jsonDecode(list[index])["name"] == "user"
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: cardChat(
                              context: context,
                              isLeft: jsonDecode(list[index])["name"] == "user"
                                  ? false
                                  : true,
                              content: jsonDecode(list[index])["message"]),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink();
        },
        itemCount: list.length);
  }

  Widget _buildBody({bool? chatNew}) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
          context: context,
          title: "Cuộc hội thoại",
          action: IconButton(
              onPressed: () {}, icon: Image.asset("assets/icons/Group.png"))),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(width: size.width, child: _listChat()),
            ),
            chatNew == true
                ? Column(
                    children: [
                      suggestions(
                          content: "Xin chào",
                          context: context,
                          onTap: () {
                            message = "Xin Chào";
                            chat();
                            messageController!.text = "";
                          }),
                      suggestions(
                          content: "Công ty này tên gì?",
                          context: context,
                          onTap: () {
                            message = "Công ty này tên gì?";
                            chat();
                            messageController!.text = "";
                          }),
                    ],
                  )
                : const SizedBox.shrink(),
            SingleChildScrollView(
              child: Container(
                  color: Hex.fromHex("#F1F4F7"),
                  height: size.width / 6,
                  width: size.width,
                  child: _bottom()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottom() {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/Icon.png",
              height: size.width / 20,
              width: size.width / 20,
            )),
        Container(
          width: size.width / 1.4,
          height: size.width / 8,
          decoration: BoxDecoration(
              color: Hex.fromHex("#FFFFFF"),
              borderRadius: BorderRadius.all(Radius.circular(size.width / 30))),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: size.width / 28,
                left: size.width / 20,
                right: size.width / 20,
                top: size.width / 28),
            child: Center(
              child: TextField(
                controller: messageController,
                onChanged: (value) {
                  message = value;
                },
                key: _formKey,
                onSubmitted: (string) {
                  setState(() {});
                  messageController!.text = "";
                  _controller!.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                decoration: InputDecoration.collapsed(
                    hintText: "Write a message...",
                    hintStyle: GoogleFonts.aBeeZee(
                        color: Hex.fromHex("#6B779A"),
                        fontWeight: FontWeight.w300,
                        fontSize: 15)),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () async {
              sender = await getId();
              if (message!.length != 0) {
                chat();
              }

              messageController!.text = "";
              _controller!.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
            icon: Image.asset(
              "assets/icons/paper-plane.png",
              color: Colors.black,
              height: size.width / 20,
              width: size.width / 20,
            ))
      ],
    );
  }

  void chat() {
    BlocProvider.of<ChatBloc>(context).add(ChatE(sender!, message!));
  }

  void isChat() {
    BlocProvider.of<ChatBloc>(context).add(IsChat());
  }

  void clear() {
    BlocProvider.of<ChatBloc>(context).add(ClearE());
  }
}
