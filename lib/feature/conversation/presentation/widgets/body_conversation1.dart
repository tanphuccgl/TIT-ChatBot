import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/config/const.dart';
import 'package:tit_chat_bot/core/utils/appbar_cus.dart';
import 'package:tit_chat_bot/core/utils/card_chat_widget.dart';
import 'package:tit_chat_bot/core/utils/device_info.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_bloc.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_event.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/manager/chat/chat_state.dart';
import 'package:tit_chat_bot/main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:web_socket_channel/web_socket_channel.dart';

class BodyConversation1 extends StatefulWidget {
  const BodyConversation1({Key? key}) : super(key: key);

  @override
  _BodyConversation1State createState() => _BodyConversation1State();
}

class _BodyConversation1State extends State<BodyConversation1> {
  TextEditingController? messageController;
  String? sender;
  String? message;
  List<String>? list;
  GlobalKey<FormState>? _formKey;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
    connect();
  }
  //
  // void connect() {
  //   IO.Socket socket = IO.io("https://chatbot.titkul.edu.vn", <String, dynamic>{
  //     ///default
  //     "autoConnect": true,
  //   });
  //   socket.connect();
  //   log("connect: ${socket.connected.toString()}");
  //
  //   ///kết nối với server
  //   /// lấy dữ liệu
  //   socket.on("connect", (data) {
  //     if (data != null) {}
  //     setState(() {});
  //   });
  //
  //   socket.on('connect_error', (error) => {log("error $error")});
  //
  //   socket.on('disconnect', (reason) => {log("disconnect $reason")});
  // }
  void connect() {
    IO.Socket socket   = IO.io("http://chatbot.titkul.edu.vn", <String, dynamic>{
      // "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.on('connect_error', (error) => {log("error $error")});
    print(socket.connected);
    // socket.emit("signin", widget.sourchat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        // setMessage("destination", msg["message"]);
        // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket.on('connect_error', (error) => {log("error $error")});
    print(socket.connected);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Socket"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Send any message to the server"),
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
