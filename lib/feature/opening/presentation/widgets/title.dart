import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class XTitle extends StatelessWidget {
  const XTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const _title = "TIT - ChatBot";
    const _content =
        "Giải đáp thắc mắc, tìm kiếm thông tin trên nhiều lĩnh vực cho bạn";
    return Column(
      children: [
        Text(
          _title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: size.width / 12.2725,
              color: MyColor.black,
              letterSpacing: -0.015),
        ),
        SizedBox(
          height: size.width / 20,
        ),
        SizedBox(
          width: size.width / 1.2,
          child: Text(
            _content,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: size.width / 23.1011,
                color: MyColor.grey,
                letterSpacing: -0.015),
          ),
        ),
      ],
    );
  }
}
