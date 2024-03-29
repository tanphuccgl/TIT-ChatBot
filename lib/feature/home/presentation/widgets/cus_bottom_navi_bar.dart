import 'package:flutter/material.dart';
import 'package:tit_chat_bot/core/utils/hex_color.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int? index;

  const CustomBottomNavigationBar({Key? key, this.index}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
            context, PageRoutes.homePage, (Route<dynamic> route) => false);

        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(
            context, PageRoutes.openingPage, (Route<dynamic> route) => false);

        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(
            context, PageRoutes.conversation, (Route<dynamic> route) => false);

        break;
      case 3:
        break;
      case 4:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(239, 241, 244, 1),
              spreadRadius: 1,
              offset: Offset(0, -4),
              blurRadius: 20),
        ],
      ),
      child: ClipRRect(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/home-house-line.png"),
                label: ('Home')),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Group, User.png"),
                label: ('Contacts')),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Globe, Wifi.png"),
                label: ("Services")),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/Messages, Chat.png"),
                label: ('Messages')),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/setting4.png"),
                label: ('Settings')),
          ],
          currentIndex: widget.index ?? selectedIndex,
          selectedItemColor: Colors.black,
          onTap: onItemTapped,
          backgroundColor: Colors.white,
          unselectedItemColor: Hex.fromHex("#949BA5"),enableFeedback: false,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Hex.fromHex("#212226")),
          unselectedLabelStyle: TextStyle(color: Hex.fromHex("#949BA5")),
        ),
      ),
    );
  }
}
