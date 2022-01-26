import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';

Widget cardChat({
  BuildContext? context,
  String? content,
  bool? isLoading,
  bool? isLeft,
}) {
  Size size = MediaQuery.of(context!).size;
  return isLoading == false
      ? Container(
          // width: size.width / 1.65,
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
              color: Hex.fromHex("#121F33")),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width / 1.65,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 32.72,
                  vertical: size.width / 24.545),
              child: AutoSizeText(
                "$content",
                group: AutoSizeGroup(),
                maxLines: 99999,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: size.width / 23.101,
                    color: Hex.fromHex("#FFFFFF"),
                    letterSpacing: -0.015),
              ),
            ),
          ),
        )
      : cardChatLoading(context: context);
}

Widget cardChatLoading({
  BuildContext? context,
}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    // width: size.width / 1.65,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(size.width / 98.18),
            bottomRight: Radius.circular(size.width / 16.36),
            topLeft: Radius.circular(size.width / 16.36),
            topRight: Radius.circular(size.width / 16.36)),
        color: Hex.fromHex("#121F33")),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: size.width / 5,
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 32.72, vertical: size.width / 40),
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 20,
          )),
    ),
  );
}

Widget suggestions(
    {BuildContext? context, String? content, Function()? onTap}) {
  Size size = MediaQuery.of(context!).size;
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // width: size.width / 1.65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width / 16.36),
                  bottomRight: Radius.circular(size.width / 16.36),
                  topLeft: Radius.circular(size.width / 16.36),
                  topRight: Radius.circular(size.width / 16.36)),
              color: Hex.fromHex("#121F33")),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width / 1.65,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 32.72,
                  vertical: size.width / 24.545),
              child: AutoSizeText(
                "$content",
                group: AutoSizeGroup(),
                maxLines: 99999,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: size.width / 23.101,
                    color: Hex.fromHex("#FFFFFF"),
                    letterSpacing: -0.015),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
