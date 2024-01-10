import 'dart:convert';

import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<List<BirdFamily>?> getBirdFamilies() async {
  final response = await ApiService.get(ApiConfig.ENDPOINT['family']!['index']);
  final familyData = response as List;
  final List<BirdFamily> families = [];
  for (var element in familyData) {
    families.add(BirdFamily.fromJson(element));
  }
  return families;
}
