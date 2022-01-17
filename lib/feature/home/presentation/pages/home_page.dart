import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/card_chat_widget.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/cus_bottom_navi_bar.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/gridview.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Hex.fromHex("#f7f7f7"),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.all(size.width / 20),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(
                  height: size.width / 20,
                ),
                _header(
                  name: "Andie Le",
                  urlImage: "assets/images/Ellipse 3 (1).png",
                ),
                SizedBox(
                  height: size.width / 20,
                ),
                _background(),
                listView(context: context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _background() {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 1.4,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: cardChat(
                  context: context,
                  content: "Hãy chọn lĩnh vực bạn cần TIT Tư vấn nhé!",
                  isLeft: true),
            ),
          ),
          Positioned(
              top: size.width / 35,
              child: Align(alignment: Alignment.topLeft, child: _imageBot())),
        ],
      ),
    );
  }

  Widget _imageBot() {
    return Image.asset(
      "assets/images/zyro-image 2.png",
      fit: BoxFit.cover,
    );
  }

  Widget _header({String? name, String? urlImage}) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 8.01,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  urlImage!,
                  height: size.width,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width / 30,
              ),
              SizedBox(
                height: size.width / 8.01,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Xin chào $name!",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width / 21.81,
                          color: Hex.fromHex("#212226"),
                          letterSpacing: -0.015),
                    ),
                    Text(
                      "Chào mừng đến TIT ChatBot",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width / 24.545,
                          color: Hex.fromHex("#949BA5"),
                          letterSpacing: -0.015),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: Image.asset(
              'assets/icons/menu.png',
              color: Colors.black,
              height: size.width / 15,
              width: size.width / 15,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class Item {
  IconData? icon;
  String? text;

  Item({Key? key, this.text, this.icon});
}

List<Item> list = [
  Item(text: "Lĩnh vực 1", icon: null),
  Item(text: "Lĩnh vực 2", icon: null),
  Item(text: "Lĩnh vực 3", icon: null),
  Item(text: "Lĩnh vực 4", icon: null),
  Item(text: "Lĩnh vực 5", icon: null),
  Item(text: "Lĩnh vực 6", icon: null),
  Item(text: "Lĩnh vực 7", icon: null),
  Item(text: "Lĩnh vực 8", icon: null),
  Item(text: "Lĩnh vực 9", icon: null),
  Item(text: "Lĩnh vực 10", icon: null),
];
