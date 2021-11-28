import 'dart:convert';


class ChatData {
  String? recipientId;
  String? text;

  ChatData({this.recipientId, this.text});

  ChatData.fromJson(Map<String, dynamic> json) {
    recipientId = json['recipient_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipient_id'] = this.recipientId;
    data['text'] = this.text;
    return data;
  }
}
