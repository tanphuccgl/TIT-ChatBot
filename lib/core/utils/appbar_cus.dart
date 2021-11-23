import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';

AppBar appBar({BuildContext? context, String? title,Widget? action}) {
  Size size = MediaQuery.of(context!).size;
  return AppBar(
    title:  Text(
      title!,
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: size.width / 19.636,
          color: HexColor.fromHex("#0F1A2A"),
          letterSpacing: -0.015),
    ),
    elevation: 0,
    centerTitle: true,
    actions: [
      action!,
      // IconButton(onPressed: () {}, icon: Image.asset("asstes/icons/Group.png"))
    ],
    leading: IconButton(
        onPressed: () {}, icon: Image.asset("assets/icons/Path.png",height: 10,width: 10,)),
    backgroundColor: Colors.white,
  );
}
