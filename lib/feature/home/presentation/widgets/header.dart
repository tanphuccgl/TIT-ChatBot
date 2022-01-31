import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class XHeader extends StatelessWidget {
  const XHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const name = "Andie Le";
    const urlImage = MyAsset.avatarImage;
    const menuIcon = MyAsset.menuIcon;
    return SizedBox(
      height: size.width / 8.01,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width / 30,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Xin chào $name!",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width / 21.81,
                          color: MyColor.black,
                          letterSpacing: -0.015),
                    ),
                    Text(
                      "Chào mừng đến TIT ChatBot",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width / 24.545,
                          color: MyColor.grey,
                          letterSpacing: -0.015),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Image.asset(
              menuIcon,
              color: MyColor.black,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
