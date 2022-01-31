import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

AppBar appBarCustom(BuildContext context,
    {required String title, required Widget action}) {
  final Size size = MediaQuery.of(context).size;
  const menuIcon = MyAsset.menu2Icon;
  const backIcon = MyAsset.backIcon;
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: size.width / 19.636,
          color: MyColor.black3,
          letterSpacing: -0.015),
    ),
    elevation: 0,
    centerTitle: true,
    actions: [
      IconButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {},
          icon: Image.asset(menuIcon))
    ],
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(
          backIcon,
          height: 10,
          width: 10,
        )),
    backgroundColor: Colors.white,
  );
}
