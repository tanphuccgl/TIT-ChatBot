import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/feature/home/presentation/pages/home_page.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/cus_bottom_navi_bar.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/background.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/button_custom.dart';

class OpeningPage extends StatefulWidget {
  static const String routeName = "/OpeningPage";

  const OpeningPage({Key? key}) : super(key: key);

  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("size width : ${size.width}");
    print("size heigth : ${size.height}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              background(context: context),
              Container(
                  width: size.width,
                  height: (size.height) / 3,
                  child: Column(
                    children: [
                      _title(),
                      SizedBox(
                        height: size.width / 20,
                      ),
                      _description(),
                      SizedBox(
                        height: size.width / 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonCustom(
                              text: "Sign Up",
                              function: () {},
                              isColor: true,
                              context: context),
                          buttonCustom(
                              text: "Sign In",
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              isColor: false,
                              context: context),
                        ],
                      ),
                    ],
                  )),
            ],
          )),
    );
  }

  Widget _description() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 1.2,
      child: Text(
        "Giải đáp thắc mắc, tìm kiếm thông tin trên nhiều lĩnh vực cho bạn ",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: size.width / 23.1011,
            color: HexColor.fromHex("#949BA5"),
            letterSpacing: -0.015),
      ),
    );
  }

  Widget _title() {
    Size size = MediaQuery.of(context).size;

    return Text(
      "TIT - ChatBot",
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: size.width / 12.2725,
          color: HexColor.fromHex("#212226"),
          letterSpacing: -0.015),
    );
  }
}
