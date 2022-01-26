class ChatData {
  String? recipientId;
  String? text;

  ChatData({this.recipientId, this.text});

  ChatData.fromJson(Map<String, dynamic> json) {
    recipientId = json['recipient_id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipient_id'] = recipientId;
    data['text'] = text;
    return data;
  }
}
