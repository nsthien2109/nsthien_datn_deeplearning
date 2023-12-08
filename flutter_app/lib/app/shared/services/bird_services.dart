import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<List<Bird?>> getBirds(int page) async {
  final response = await ApiService.get(
      ApiConfig.ENDPOINT['birds']!['index']! + '?page=${page}');

  final birdData = response['results'] as List<dynamic>;
  final List<Bird> birds = [];
  for (var element in birdData) {
    final List<String> images = [];
    element['images'].forEach((item) => images.add(item));
    birds.add(Bird(
        id: element['id'],
        commonName: element['common_name'],
        vietnameseName: element['vietnamese_name'],
        scientificName: element['scientific_name'],
        birdOrder: element['bird_order'],
        family: element['family'],
        description: element['description'],
        distribution: element['distribution'],
        diet: element['diet'],
        conservationStatus: element['conservation_status'],
        className: element['class_name'],
        images: images));
  }
  return birds;
}
