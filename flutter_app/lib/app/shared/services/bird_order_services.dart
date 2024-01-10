import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/services/api_service.dart';

Future<List<BirdOrder>?> getBirdOrders() async {
  final response = await ApiService.get(ApiConfig.ENDPOINT['orders']!['index']);
  final orderData = response as List;
  final List<BirdOrder> orders = [];
  for (var element in orderData) {
    orders.add(BirdOrder.fromJson(element));
  }
  return orders;
}
