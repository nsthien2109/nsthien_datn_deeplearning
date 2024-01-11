import 'dart:convert';

import 'package:njha_bird_detect/app/models/bird_status.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

// Future<List<BirdStatus>> getAllBirdStatus() async {
//   final response = await ApiService.get(ApiConfig.ENDPOINT['status']!['index']);
//   final statusData = response as List<dynamic>;
//   final List<BirdStatus> status = [];
//   for (var element in statusData) {
//     status.add(BirdStatus.fromJson(element));
//   }
//   return status ?? [];
// }

import 'package:http/http.dart' as http;



Future<List<BirdStatus>?> getAllBirdStatus() async {
  try{
    final response = await http.get(Uri.parse('http://34.126.163.62/api/status'));
    if (response.statusCode == 200) {
      final statusResponse = json.decode(response.body);
      final statusData = statusResponse as List<dynamic>;
      final List<BirdStatus> status = [];
      for (var element in statusData) {
        status.add(BirdStatus.fromJson(element));
      }
      return status;
    }else{
      return [];
    }
  }catch (e){
    rethrow;
  }
}

Future<BirdStatus?> getBirdStatus(int id) async {
  try{
    final response = await http.get(Uri.parse('http://34.126.163.62/api/status/$id'));
    if (response.statusCode == 200) {
      final statusResponse = json.decode(response.body);
      return BirdStatus.fromJson(statusResponse);
    }else{
      return BirdStatus();
    }
  }catch (e){
    rethrow;
  }
}
