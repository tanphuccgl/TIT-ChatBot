import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tit_chat_bot/core/config/const.dart';
import 'package:tit_chat_bot/core/error/exceptions.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';

List<ChatData> breweryModelFromJson(String str) =>
    List<ChatData>.from(json.decode(str).map((x) => ChatData.fromJson(x)));

abstract class ChatRemoteDataSource {
  Future<List<ChatData>> chat(String sender, String message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client? client;

  ChatRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<ChatData>> chat(String sender, String message) {
    return _chat(sender, message);
  }

  Future<List<ChatData>> _chat(String sender, String message) async {
    var body = jsonEncode({'sender': sender, 'message': message});
    final response = await client
        ?.post(Uri.parse('$mainUrl/webhooks/rest/webhook'),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json" // k co header la failed 415
              //'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: body)
        .timeout(Duration(seconds: 15));
    log("Post Chat: " + '$mainUrl/webhooks/rest/webhook');
    log("Post body Chat: " + body);
    log("Response Json Chat: ${json.decode(response!.body)}");

    if (response.statusCode == 200) {
      var success = breweryModelFromJson(response.body);
      print(success);
      return success;
    } else {
      throw ServerException();
    }
  }
}
