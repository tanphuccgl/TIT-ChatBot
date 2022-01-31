import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';

class AlertDialog1 extends StatelessWidget {
  static const String routeName = '/AlertDialog1';

  final String? title;
  final String? description;
  final Function()? onPressed;
  // final String? image;
  const AlertDialog1({
    Key? key,
    @required this.title,
    @required this.description,
    @required this.onPressed,
    //    @required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Cormorant",
                          fontSize: size.width / 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 128,
                    ),
                    Center(
                      child: Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Cormorant",
                            fontSize: size.width / 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 32,
                    ),
                    SizedBox(
                      width: size.width / 3,
                      height: size.width / 8,
                      child: ElevatedButton(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Cormorant",
                              fontSize: size.width / 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                            primary: MyColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(size.width / 25),
                              // side: BorderSide(color: Colors.red)
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ));
  }
}

/// dialog báo lỗi
void errorDialog(
    {String? description, Function()? function, BuildContext? context}) {
  var alert = AlertDialog1(
    title: "ERROR",
    description: description,
    onPressed: function,
  );
  showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) {
        return alert;
      });
}

/// dialog thành công
void successDialog(
    {String? description, Function()? function, BuildContext? context}) {
  var alert = AlertDialog1(
    title: "SUCCESS",
    description: description,
    onPressed: function,
  );
  showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) {
        return alert;
      });
}

/// dialog bảo trì - khi server bị lỗi
void maintenanceDialog({Function()? function, BuildContext? context}) {
  var alert = AlertDialog1(
    title: "MAINTENANCE",
    description: "Hệ thống đang bảo trì",
    onPressed: function,
  );
  showDialog(
      context: context!,
      builder: (context) {
        return alert;
      });
}

void developingDialog({ BuildContext? context}) {
  var alert = AlertDialog1(
    title: "DEVELOPING",
    description: "Chức năng đang phát triển",
    onPressed: () {
      Navigator.pop(context!);
    },
  );
  showDialog(
      context: context!,
      builder: (context) {
        return alert;
      });
}

void loadingDialog({BuildContext? context}) {
  var alert = Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
              height: 230,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: SpinKitCircle(
                    color: Colors.lightBlueAccent,
                  ))),
        ],
      ));
  showDialog(
      context: context!,
      builder: (context) {
        return alert;
      });
}