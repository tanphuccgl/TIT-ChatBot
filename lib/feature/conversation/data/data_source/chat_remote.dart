import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tit_chat_bot/core/config/const.dart';
import 'package:tit_chat_bot/core/error/exceptions.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';

List<ChatData> chatModelFromJson(String str) =>
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
    await Future.delayed(Duration(seconds: 5));
    var body = jsonEncode({'sender': sender, 'message': message});
    final response = await client
        ?.post(Uri.parse(mainUrl),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            },
            body: body)
        .timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response("Error", 408);
    });

    log("Post body Chat: ${response!.statusCode} ");

    if (response.statusCode == 200) {
      var success = chatModelFromJson(response.body);

      return success;
    } else if (response.statusCode == 408) {
      throw ServerException();
    } else {
      throw ServerException();
    }
  }
}
