import 'package:flutter/material.dart';
import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/models/bird_status.dart';
import 'package:njha_bird_detect/app/shared/services/bird_family_services.dart';
import 'package:njha_bird_detect/app/shared/services/bird_order_services.dart';
import 'package:njha_bird_detect/app/shared/services/bird_status_services.dart';

class FilterProvider extends ChangeNotifier {
  List<BirdStatus> _birdStatus = [];
  List<BirdFamily> _birdFamilies = [];
  List<BirdOrder> _birdOrders = [];

  List<BirdStatus> get birdStatus => _birdStatus;
  List<BirdFamily> get birdFamilies => _birdFamilies;
  List<BirdOrder> get birdOrders => _birdOrders;

  FilterProvider() {
    getAllStatus();
    getAllFamilies();
    getAllOrders();
  }

  Future<void> getAllStatus() async {
    try {
      var statusData = await getAllBirdStatus();
      _birdStatus = statusData ?? [];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllFamilies() async {
    try {
      var familyData = await getBirdFamilies();
      _birdFamilies = familyData ?? [];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllOrders() async {
    try {
      var orderData = await getBirdOrders();
      _birdOrders = orderData ?? [];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
