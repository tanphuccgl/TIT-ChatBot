import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class Suggestion extends StatelessWidget {
  final String label;
  final Function() voidCallBack;
  const Suggestion({Key? key, required this.voidCallBack, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final border = size.width / 16.36;
    final paddingHori = size.width / 32.72;
    final paddingVer = size.width / 24.545;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: voidCallBack,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(border),
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
          ),
        ),
      ),
    );
  }
}

