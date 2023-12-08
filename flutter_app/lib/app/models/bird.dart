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
    data['class_name'] = className;
    data['images'] = images;
    return data;
  }
}
