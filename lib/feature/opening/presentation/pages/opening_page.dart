import 'package:flutter/material.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/background.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/bottom_bar.dart';
import 'package:tit_chat_bot/feature/opening/presentation/widgets/title.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const XBackground(),
              SizedBox(
                  width: size.width,
                  height: (size.height) / 3,
                  child: Column(
                    children: [
                      const XTitle(),
                      SizedBox(
                        height: size.width / 15,
                      ),
                      const XBottomBar(),
                    ],
                  )),
            ],
          )),
    );
  }
}
