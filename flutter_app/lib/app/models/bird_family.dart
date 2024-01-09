import 'package:njha_bird_detect/app/models/bird.dart';

class BirdFamily {
  int? id;
  String? familyName;
  String? familyVietnameseName;
  List<Bird>? birds;

  BirdFamily({this.id, this.familyName, this.familyVietnameseName, this.birds});

  BirdFamily.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    familyName = json['familyName'];
    familyVietnameseName = json['familyVietnameseName'];
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
    data['familyName'] = familyName;
    data['familyVietnameseName'] = familyVietnameseName;
    if (birds != null) {
      data['birds'] = birds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
