import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tit_chat_bot/core/utils/my_colors.dart';
import 'package:tit_chat_bot/core/utils/page_routes.dart';
import 'package:tit_chat_bot/feature/home/data/models/field_model.dart';


class FieldItem extends StatelessWidget {
  final Field data;

  const FieldItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String label = data.label ?? "N/A";
    final String image = data.image ?? "";
    return Padding(
      padding: EdgeInsets.all(size.width / 35),
      child: SizedBox(
        width: size.width / 3,
        height: size.width / 2.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.width / 25),
              ),
              primary: MyColor.white,
              elevation: 8,
              shadowColor: MyColor.black,
              onPrimary: MyColor.primary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: size.width / 6,
                  height: size.width / 6,
                  child: CircleAvatar(
                    child: Image.asset(image),
                  )),
              SizedBox(
                height: size.width / 50,
              ),
              Text(
                label,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width / 21.81,
                    color: MyColor.black2,
                    letterSpacing: -0.015),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, PageRoutes.conversation);
          },
        ),
      ),
    );
  }
}
