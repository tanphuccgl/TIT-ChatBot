import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/background_home.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/field_list.dart';
import 'package:tit_chat_bot/feature/home/presentation/widgets/header.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final padding = size.width / 20;
    return Scaffold(
      backgroundColor: MyColor.whiteBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(padding, padding, padding, padding),
          child: Column(
            children: [
              const XHeader(),
              SizedBox(
                height: size.width / 20,
              ),
              const Expanded( child: Center(child: XBackgroundHome())),
              const Expanded(child: XFieldList())
            ],
          ),
        ),
      ),
    );
  }
}
