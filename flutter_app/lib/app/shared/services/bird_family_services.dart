import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';


import 'package:http/http.dart' as http;

// Future<List<BirdFamily>> getBirdFamilies() async {
//
//
//   final List<BirdFamily> families = [];
//   for (var element in familyData) {
//     families.add(BirdFamily.fromJson(element));
//   }
//   return families ?? [];
// }


 Future<List<BirdFamily>?> getBirdFamilies() async {
    try{
      final response = await http.get(Uri.parse('http://34.126.163.62/api/family'));
      if (response.statusCode == 200) {
        final familyResponse = json.decode(response.body);
        final familyData = familyResponse as List<dynamic>;
        final List<BirdFamily> families = [];
        for (var element in familyData) {
          families.add(BirdFamily.fromJson(element));
        }
        return families;
      }else{
        return [];
      }
    }catch (e){
      rethrow;
    }
}


Future<BirdFamily?> getBirdFamily(int id) async {
  try{
    final response = await http.get(Uri.parse('http://34.126.163.62/api/family/$id'));
    if (response.statusCode == 200) {
      final familyResponse = json.decode(response.body);
      return BirdFamily.fromJson(familyResponse);
    }else{
      return BirdFamily();
    }
  }catch (e){
    rethrow;
  }
}
