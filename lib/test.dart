
import 'package:flutter/material.dart';


class AA extends StatefulWidget {
  static const String routeName = "/AA";
  const AA({Key? key}) : super(key: key);

  @override
  AAState createState() => AAState();
}

class AAState extends State<AA> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
      body:const Center(child: Text("dang bao tri nha ")),
    );
  }
}
