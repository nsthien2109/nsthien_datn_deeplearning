class Bird {
  int? id;
  String? commonName;
  String? vietnameseName;
  String? scientificName;
  String? birdOrder;
  String? family;
  String? description;
  String? distribution;
  String? diet;
  String? conservationStatus;
  String? className;
  double? confidence;
  List<String>? images;

  Bird(
      {this.id,
      this.commonName,
      this.vietnameseName,
      this.scientificName,
      this.birdOrder,
      this.family,
      this.description,
      this.distribution,
      this.diet,
      this.conservationStatus,
      this.className,
      this.confidence,
      this.images});

  Bird.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    vietnameseName = json['vietnamese_name'];
    scientificName = json['scientific_name'];
    birdOrder = json['bird_order'];
    family = json['family'];
    description = json['description'];
    distribution = json['distribution'];
    diet = json['diet'];
    conservationStatus = json['conservation_status'];
    confidence = json['confidence'];
    className = json['class_name'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['common_name'] = commonName;
    data['vietnamese_name'] = vietnameseName;
    data['scientific_name'] = scientificName;
    data['bird_order'] = birdOrder;
    data['family'] = family;
    data['description'] = description;
    data['distribution'] = distribution;
    data['diet'] = diet;
    data['conservation_status'] = conservationStatus;
    data['confidence'] = confidence;
    data['class_name'] = className;
    data['images'] = images;
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
