import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class XButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isColor;
  const XButton(
      {Key? key,
      required this.text,
      required this.isColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 2.409,
      height: size.width / 7.012,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: isColor == true ? MyColor.primary : MyColor.white,
            onPrimary: isColor == false ? MyColor.primary : MyColor.white,
            splashFactory: InkRipple.splashFactory,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.width / 28),
                side: BorderSide(color: MyColor.primary, width: 1.5))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: size.width / 23,
                color: isColor == true ? MyColor.white : MyColor.primary,
                letterSpacing: -0.015),
          ),
        ),
      ),
    );
  }
}
