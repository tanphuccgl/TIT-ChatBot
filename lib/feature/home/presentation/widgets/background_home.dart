import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';
import 'package:tit_chat_bot/widgets/message/message_chat.dart';

class XBackgroundHome extends StatelessWidget {
  const XBackgroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final zyroImage = MyAsset.zyroImage;
    const label = "Hãy chọn lĩnh vực bạn cần TIT Tư vấn nhé!";
    return SizedBox(
      height: size.width / 1.4,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: MessageChat(
              isUser: true,
              label: label,
            ),
          ),
          Positioned(
              top: size.width / 35,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    zyroImage,
                    fit: BoxFit.cover,
                  ))),
        ],
      ),
    );
  }
}
