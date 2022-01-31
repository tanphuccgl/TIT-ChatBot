import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class MessageChat extends StatelessWidget {
  final String label;
  final bool isUser;
  const MessageChat({Key? key, required this.isUser, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHori = size.width / 32.72;
    final paddingVer = size.width / 24.545;
    final smallBorder = size.width / 98.18;
    final border = size.width / 16.36;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: isUser == true
                  ? Radius.circular(smallBorder)
                  : Radius.circular(border),
              bottomRight: isUser == true
                  ? Radius.circular(border)
                  : Radius.circular(smallBorder),
              topLeft: Radius.circular(border),
              topRight: Radius.circular(border)),
          color: MyColor.nightLight),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: size.width / 1.65,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: paddingHori, vertical: paddingVer),
          child: AutoSizeText(
            label,
            group: AutoSizeGroup(),
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: size.width / 23.101,
                color: MyColor.white,
                letterSpacing: -0.015),
          ),
        ),
      ),
    );
  }
}
