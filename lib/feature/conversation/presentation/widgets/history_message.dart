import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tit_chat_bot/Prefs/prefs.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';
import 'package:tit_chat_bot/widgets/message/message_chat.dart';
import 'package:tit_chat_bot/widgets/message/message_loading.dart';

class HistoryMessage extends StatelessWidget {
  final ScrollController scrollController;
  final int itemCount;
  final bool isLazyLoad;
  const HistoryMessage(
      {Key? key,
      required this.scrollController,
      required this.isLazyLoad,
      required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List list = Prefs.getLocalListMessage().reversed.toList();

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        reverse: true,
        itemBuilder: (context, index) {
          if (index == itemCount - 1 && list.length != itemCount) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                isLazyLoad
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : const SizedBox.shrink(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    jsonDecode(list[index])["name"] == "user"
                        ? const SizedBox.shrink()
                        : _avatarBotChat(context),
                    SizedBox(
                      width: jsonDecode(list[index])["name"] == "user"
                          ? size.width
                          : size.width / 1.15,
                      child: Align(
                        alignment:
                            jsonDecode(list[index])["name"] == "user"
                                ? Alignment.topRight
                                : Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: MessageChat(
                            isUser:
                                jsonDecode(list[index])["name"] == "user"
                                    ? false
                                    : true,
                            label: jsonDecode(list[index])["message"],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          if (list[index] == "messLoading") {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _avatarBotChat(context),
                SizedBox(
                  width: size.width / 1.15,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: MessageLoading(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              jsonDecode(list[index])["name"] == "user"
                  ? const SizedBox.shrink()
                  : _avatarBotChat(context),
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
                    child: MessageChat(
                      isUser: jsonDecode(list[index])["name"] == "user"
                          ? false
                          : true,
                      label: jsonDecode(list[index])["message"],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: list.length < 20 ? list.length : itemCount);
  }
}

Widget _avatarBotChat(BuildContext context) {
  final size = MediaQuery.of(context).size;
  const avatarImage = MyAsset.avatarBotChat;
  final leftPadding = size.width / 60;
  final bottomPadding = size.width / 50;
  return Padding(
    padding: EdgeInsets.only(left: leftPadding, bottom: bottomPadding),
    child: SizedBox(
      width: size.width / 10,
      child: const CircleAvatar(
        backgroundImage: AssetImage(avatarImage),
      ),
    ),
  );
}
