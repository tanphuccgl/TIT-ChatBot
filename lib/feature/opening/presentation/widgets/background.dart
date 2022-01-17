import 'package:flutter/cupertino.dart';

Widget background({BuildContext? context}) {
  Size size = MediaQuery.of(context!).size;
  return SizedBox(
    width: size.width,
    height: (2 * size.height) / 3,
    child: Stack(
      children: [
        Image.asset("assets/images/Ellipse 1.png"),
        Image.asset("assets/images/Ellipse 2.png"),

        Positioned(
            right: -(size.height / 19.636),
            child: Image.asset("assets/images/Rectangle 1.png")),
        //
        Image.asset("assets/images/Polygon 1.png"),
        Image.asset("assets/images/Union.png"),
        Positioned(
            top: (size.height) / 4,
            child: Image.asset("assets/images/zyro-image 1.png")),
      ],
    ),
  );
}
