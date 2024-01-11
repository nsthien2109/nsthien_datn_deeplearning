import 'package:njha_bird_detect/app/models/bird_status.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<List<BirdStatus>?> getAllBirdStatus() async {
  final response = await ApiService.get(ApiConfig.ENDPOINT['status']!['index']);
  final statusData = response as List;
  final List<BirdStatus> status = [];
  for (var element in statusData) {
    status.add(BirdStatus.fromJson(element));
  }
  return status;
}
