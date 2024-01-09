import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/models/bird_order.dart';

class BirdStatus {
  int? id;
  String? statusName;
  String? statusVietnameseName;
  List<Bird>? birds;

  BirdStatus({this.id, this.statusName, this.statusVietnameseName, this.birds});

  BirdStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['statusName'];
    statusVietnameseName = json['statusVietnameseName'];
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
    data['statusName'] = statusName;
    data['statusVietnameseName'] = statusVietnameseName;
    if (birds != null) {
      data['birds'] = birds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
