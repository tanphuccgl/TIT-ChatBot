import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class XBottomMessage extends StatelessWidget {
  final Function() leftCallBack;
  final Function() rightCallBack;
  final TextEditingController messageController;
  final Function(String) onChangeTextField;
  final Function(String) onSubmitTextField;

  const XBottomMessage(
      {Key? key,
      required this.leftCallBack,
      required this.onChangeTextField,
      required this.onSubmitTextField,
      required this.rightCallBack,
      required this.messageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const leftIcon = MyAsset.plusIcon;
    const rightIcon = MyAsset.sendIcon;
    const hintText = "Write a message...";
    final paddingHori = size.width / 20;
    final paddingVer = size.width / 28;
    return SizedBox(
      height: size.width / 6,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                leftIcon,
                height: size.width / 20,
                width: size.width / 20,
              )),
          Container(
            width: size.width / 1.4,
            height: size.width / 8,
            decoration: BoxDecoration(
                color: MyColor.whiteBackground,
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width / 30))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHori, vertical: paddingVer),
              child: Center(
                child: TextField(
                  controller: messageController,
                  onChanged: onChangeTextField,
                  textInputAction: TextInputAction.go,
                  onSubmitted: onSubmitTextField,
                  decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle: GoogleFonts.aBeeZee(
                          color: MyColor.greyLight,
                          fontWeight: FontWeight.w300,
                          fontSize: 15)),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: rightCallBack,
              icon: Image.asset(
                rightIcon,
                color: Colors.black,
                height: size.width / 20,
                width: size.width / 20,
              ))
        ],
      ),
    );
  }
}
