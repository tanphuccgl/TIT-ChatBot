import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/button.dart';

class XBottomBar extends StatelessWidget {
  const XBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        XButton(
          text: "Sign Up",
          isColor: true,
          onPressed: () {},
        ),
        XButton(
          text: "Sign In",
          onPressed: () {
            Navigator.pushNamed(context, PageRoutes.homePage);
          },
          isColor: false,
        ),
      ],
    );
  }
}
