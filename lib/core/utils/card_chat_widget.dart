import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';

Widget cardChat({BuildContext? context, String? content, bool? isLeft}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    width: size.width / 1.65,
    height: size.height / 11,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: isLeft == true
                ? Radius.circular(size.width / 98.18)
                : Radius.circular(size.width / 16.36),
            bottomRight: isLeft == true
                ? Radius.circular(size.width / 16.36)
                : Radius.circular(size.width / 98.18),
            topLeft: Radius.circular(size.width / 16.36),
            topRight: Radius.circular(size.width / 16.36)),
        color: HexColor.fromHex("#121F33")),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width / 32.72, vertical: size.width / 24.545),
      child: Text(
        "$content",
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: size.width / 23.101,
            color: HexColor.fromHex("#FFFFFF"),
            letterSpacing: -0.015),
      ),
    ),
  );
}
