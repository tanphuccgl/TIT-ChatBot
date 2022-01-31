import 'package:flutter/cupertino.dart';
import 'package:tit_chat_bot/core/utils/my_assets.dart';

class XBackground extends StatelessWidget {
  const XBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: (2 * size.height) / 3,
      child: Stack(
        children: [
          Image.asset(MyAsset.ellipseYellow),
          Image.asset(MyAsset.ellipseGreen),
          Positioned(
              right: -(size.height / 19.636),
              child: Image.asset(MyAsset.ellipseBlue)),
          Image.asset(MyAsset.ellipsePink),
          Image.asset(MyAsset.unionImage),
          Positioned(
              top: (size.height) / 4,
              child: Image.asset(MyAsset.zyroHelloImage)),
        ],
      ),
    );
  }
}
