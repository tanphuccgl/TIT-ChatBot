import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';

Widget buttonCustom(
    {String? text,
    Function()? function,
    BuildContext? context,
    bool? isColor}) {
  Size size = MediaQuery.of(context!).size;
  return GestureDetector(
    onTap: function,
    child: Container(
      width: size.width / 2.409,
      height: size.width / 7.012,
      decoration: BoxDecoration(
        color: isColor == true
            ? HexColor.fromHex("#4361EE")
            : HexColor.fromHex("#FFFFFF"),
        border: isColor == true
            ? null
            : Border.all(color: HexColor.fromHex("#4361EE"), width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(size.width / 28.051),
        ),
      ),
      child: Center(
        child: Text(
          text!,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: size.width / 23.101,
              color: isColor == true
                  ? HexColor.fromHex("#FFFFFF")
                  : HexColor.fromHex("#4361EE"),
              letterSpacing: -0.015),
        ),
      ),
    ),
  );
}
