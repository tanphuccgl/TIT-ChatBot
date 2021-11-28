import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tit_chat_bot/core/config/const.dart';
import 'package:tit_chat_bot/core/error/exceptions.dart';
import 'package:tit_chat_bot/feature/conversation/data/data_source/chat_remote.dart';
import 'package:tit_chat_bot/feature/conversation/data/models/chat_res.dart';

abstract class ChatLocalDataSource {
  Future<List<ChatData>> getChat();

  Future<void> saveChat(List<ChatData> chatData);
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  final SharedPreferences sharedPreferences;

  ChatLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ChatData>> getChat() {
    final jsonString = sharedPreferences.getString(SAVE_CHAT_RESPONSE);
    if (jsonString != null && jsonString != '') {
      return Future.value(breweryModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveChat(List<ChatData> chatData) {
    return sharedPreferences.setString(SAVE_CHAT_RESPONSE,
        json.encode(chatData.map((i) => i.toJson()).toList()).toString());
  }
}
