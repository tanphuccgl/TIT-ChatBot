import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';

Widget gridView({BuildContext? context, List<Item>? list}) {
  Size size = MediaQuery.of(context!).size;
  return Container(
    height: size.width / 1.4,
    child: Padding(
      padding: EdgeInsets.only(right: 15, left: 15),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: size.width / 9.133,
        childAspectRatio: 3.5,
        mainAxisSpacing: size.width / 30,
        children: List.generate(list!.length, (index) {
          return Container(
            width: size.width / 2.909,
            height: size.width / 9.133,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(size.width / 65.45),
                ),
                color: HexColor.fromHex("#FFFFFF"),

                ///HexColor.fromHex("#4361EE")
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    blurRadius: 16,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ]),
            child: Material(
              child: InkWell(
                onTap: () {
                  print("Aa");
                },
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width / 65.45)),
                splashColor: HexColor.fromHex("#4361EE"),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.three_k_plus),
                      SizedBox(width: size.width/30,),
                      Text(
                        list[index].text!,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: size.width / 24.545,
                            color: HexColor.fromHex("#70737D"),
                            letterSpacing: 0.0028),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    ),
  );
}

// BoxShadow(
// color: Color.fromRGBO(69, 97, 238, 0.4),
// blurRadius: 16,
// offset: Offset(0, 4), /

// Text(
// list[index].text!,
// style: GoogleFonts.inter(
// fontWeight: FontWeight.w700,
// fontSize: size.width / 24.545,
// color: HexColor.fromHex("#FFFFFF"),
// letterSpacing: 0.0028),
// ),
