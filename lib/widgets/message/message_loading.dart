import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class MessageLoading extends StatelessWidget {
  const MessageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final smallBorder = size.width / 98.18;
    final border = size.width / 16.36;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(smallBorder),
              bottomRight: Radius.circular(border),
              topLeft: Radius.circular(border),
              topRight: Radius.circular(border)),
          color: MyColor.nightLight),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: size.width / 5,
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width / 32.72, vertical: size.width / 40),
            child: SpinKitThreeBounce(
              color: MyColor.white,
              size: 20,
            )),
      ),
    );
  }
}
