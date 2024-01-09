import 'package:njha_bird_detect/app/models/bird.dart';

class BirdOrder {
  int? id;
  String? orderName;
  String? orderVietnameseName;
  List<Bird>? birds;

  BirdOrder({this.id, this.orderName, this.orderVietnameseName, this.birds});

  BirdOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderName = json['orderName'];
    orderVietnameseName = json['orderVietnameseName'];
    if (json['birds'] != null) {
      birds = <Bird>[];
      json['birds'].forEach((v) {
        birds!.add(Bird.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderName'] = orderName;
    data['statusVietnameseName'] = orderVietnameseName;
    if (birds != null) {
      data['birds'] = birds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
