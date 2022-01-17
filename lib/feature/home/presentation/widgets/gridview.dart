import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/feature/conversation/presentation/pages/conversation_page.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';

Widget listView({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    height: size.width / 1.2,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            item(context: context, field: listField1[index]),
            item(context: context, field: listField2[index]),
          ],
        );
      },
      itemCount: listField1.length,
    ),
  );
}

Widget item({BuildContext? context, Field? field}) {
  Size size = MediaQuery.of(context!).size;
  return Padding(
    padding: EdgeInsets.all(size.width / 35),
    child: SizedBox(
      width: size.width / 3,
      height: size.width / 2.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width / 25),
            ),
            primary: Hex.fromHex("#FFFFFF"),
            elevation: 8,
            shadowColor: Hex.fromHex("#000000"),
            onPrimary: Hex.fromHex("#4361EE")),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: size.width / 6,
                height: size.width / 6,
                child: CircleAvatar(
                  child: Image.asset(field!.asset!),
                )),
            SizedBox(
              height: size.width / 50,
            ),
            Text(
              field.title!,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: size.width / 21.81,
                  color: Hex.fromHex("#222B45"),
                  letterSpacing: -0.015),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Conversation()));
        },
      ),
    ),
  );
}

class Field {
  String? title;
  String? asset;

  Field({this.title, this.asset});
}

List<Field> listField1 = [
  Field(title: "Du Lịch", asset: "assets/images/Rectangle 1048 (1).png"),
  Field(title: "Pháp Luật", asset: "assets/images/Rectangle 1048 (2).png"),
  Field(title: "Giáo Dục", asset: "assets/images/Rectangle 1049.png"),
];
List<Field> listField2 = [
  Field(title: "Covid-19", asset: "assets/images/Rectangle 1048 (4).png"),
  Field(title: "Nha Khoa", asset: "assets/images/Rectangle 1048 (5).png"),
  Field(title: "Nhân Sự", asset: "assets/images/Rectangle 1049-1.png"),
];
