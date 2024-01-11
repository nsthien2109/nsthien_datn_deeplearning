import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<BirdResponse> getBirds(int page) async {
  final response = await ApiService.get(
      ApiConfig.ENDPOINT['birds']!['index']! + '?page=${page}');

  final birdData = response['results'] as List<dynamic>;
  final List<Bird> birds = [];
  for (var element in birdData) {
    birds.add(Bird.fromJson(element));
  }
  return BirdResponse(
      results: birds,
      page: response['page'],
      pageSize: response['pageSize'],
      total: response['total'],
      totalPages: response['totalPages']);
}
