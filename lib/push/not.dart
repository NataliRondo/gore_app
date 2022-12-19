import 'dart:convert';

Not notFromJson(String str) => Not.fromJson(json.decode(str));

String notToJson(Not data) => json.encode(data.toJson());

class Not {
  Not({
    this.googleDeliveredPriority,
    this.googleSentTime,
    this.googleTtl,
    this.googleOriginalPriority,
    this.pri,
    this.vis,
    this.from,
    this.alert,
    this.bicon,
    this.licon,
    this.title,
    this.googleMessageId,
    this.googleCSenderId,
    this.androidNotificationId,
  });

  String? googleDeliveredPriority;
  int? googleSentTime;
  int? googleTtl;
  String? googleOriginalPriority;
  String? pri;
  String? vis;
  String? from;
  String? alert;
  String? bicon;
  String? licon;
  String? title;
  String? googleMessageId;
  String? googleCSenderId;
  int? androidNotificationId;

  factory Not.fromJson(Map<String, dynamic> json) => Not(
        googleDeliveredPriority: json["google.delivered_priority"],
        googleSentTime: json["google.sent_time"],
        googleTtl: json["google.ttl"],
        googleOriginalPriority: json["google.original_priority"],
        pri: json["pri"],
        vis: json["vis"],
        from: json["from"],
        alert: json["alert"],
        bicon: json["bicon"],
        licon: json["licon"],
        title: json["title"],
        googleMessageId: json["google.message_id"],
        googleCSenderId: json["google.c.sender.id"],
        androidNotificationId: json["androidNotificationId"],
      );

  Map<String, dynamic> toJson() => {
        "google.delivered_priority": googleDeliveredPriority,
        "google.sent_time": googleSentTime,
        "google.ttl": googleTtl,
        "google.original_priority": googleOriginalPriority,
        "pri": pri,
        "vis": vis,
        "from": from,
        "alert": alert,
        "bicon": bicon,
        "licon": licon,
        "title": title,
        "google.message_id": googleMessageId,
        "google.c.sender.id": googleCSenderId,
        "androidNotificationId": androidNotificationId,
      };
}
