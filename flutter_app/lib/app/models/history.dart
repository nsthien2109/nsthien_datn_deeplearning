import 'dart:convert';

import 'package:njha_bird_detect/app/models/bird.dart';

class History {
  int? id;
  String? date;
  String? url;
  List<Predictions>? predictions;

  History({this.id, this.date, this.url, this.predictions});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    url = json['url'];
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions?.add(Predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['url'] = url;
    if (predictions != null) {
      data['predictions'] = predictions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Predictions {
  int? id;
  int? confidence;
  Bird? bird;

  Predictions({this.id, this.confidence, this.bird});

  Predictions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    confidence = json['confidence'];
    bird = json['bird'] != null ? Bird.fromJson(json['bird']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['confidence'] = confidence;
    if (bird != null) {
      data['bird'] = bird!.toJson();
    }
    return data;
  }
}
