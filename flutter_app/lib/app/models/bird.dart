import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/models/bird_status.dart';

class Bird {
  int? id;
  String? commonName;
  String? vietnameseName;
  String? scientificName;
  String? description;
  String? distribution;
  String? diet;
  String? className;
  double? confidence;
  BirdStatus? status;
  BirdOrder? order;
  BirdFamily? family;
  List<String>? images;

  Bird(
      {this.id,
      this.commonName,
      this.vietnameseName,
      this.scientificName,
      this.description,
      this.distribution,
      this.diet,
      this.className,
      this.status,
      this.order,
      this.family,
      this.confidence,
      this.images});

  Bird.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    vietnameseName = json['vietnamese_name'];
    scientificName = json['scientific_name'];
    description = json['description'];
    distribution = json['distribution'];
    diet = json['diet'];
    className = json['class_name'];
    confidence = json['confidence'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    status =
        json['status'] != null ? BirdStatus.fromJson(json['status']) : null;
    order = json['order'] != null ? BirdOrder.fromJson(json['order']) : null;
    family =
        json['family'] != null ? BirdFamily.fromJson(json['family']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['common_name'] = commonName;
    data['vietnamese_name'] = vietnameseName;
    data['scientific_name'] = scientificName;
    data['description'] = description;
    data['distribution'] = distribution;
    data['diet'] = diet;
    data['class_name'] = className;
    data['confidence'] = confidence;
    data['images'] = images;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (family != null) {
      data['family'] = family!.toJson();
    }
    return data;
  }
}

class BirdResponse {
  List<Bird>? results;
  int? total;
  int? page;
  int? pageSize;
  int? totalPages;

  BirdResponse(
      {this.results, this.total, this.page, this.pageSize, this.totalPages});

  BirdResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Bird>[];
      json['results'].forEach((v) {
        results!.add(Bird.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    return data;
  }
}
