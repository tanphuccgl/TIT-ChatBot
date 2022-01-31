import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tit_chat_bot/feature/home/data/models/field_model.dart';

import 'package:tit_chat_bot/feature/home/presentation/widgets/field_item.dart';

class XFieldList extends StatelessWidget {
  const XFieldList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            FieldItem(data: listField1[index]),
            FieldItem(data: listField2[index]),
          ],
        );
      },
      itemCount: 3,
    );
  }
}
