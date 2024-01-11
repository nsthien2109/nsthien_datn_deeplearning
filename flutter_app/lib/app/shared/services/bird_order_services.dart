import 'dart:convert';

import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

// Future<List<BirdOrder>> getBirdOrders() async {
//   final response = await ApiService.get(ApiConfig.ENDPOINT['orders']!['index']);
//   final orderData = response as List<dynamic>;
//   final List<BirdOrder> orders = [];
//   for (var element in orderData) {
//     orders.add(BirdOrder.fromJson(element));
//   }
//   return orders ?? [];
// }

import 'package:http/http.dart' as http;



Future<List<BirdOrder>?> getBirdOrders() async {
  try{
    final response = await http.get(Uri.parse('http://34.126.163.62/api/orders'));
    if (response.statusCode == 200) {
      final orderResponse = json.decode(response.body);
      final orderData = orderResponse as List<dynamic>;
      final List<BirdOrder> orders = [];
      for (var element in orderData) {
        orders.add(BirdOrder.fromJson(element));
      }
      return orders;
    }else{
      return [];
    }
  }catch (e){
    rethrow;
  }
}


Future<BirdOrder?> getBirdOrder(int id) async {
  try{
    final response = await http.get(Uri.parse('http://34.126.163.62/api/orders/$id'));
    if (response.statusCode == 200) {
      final orderResponse = json.decode(response.body);
       return BirdOrder.fromJson(orderResponse);
    }else{
      return BirdOrder();
    }
  }catch (e){
    rethrow;
  }
}
