import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/wines.dart'; // Assuming Wine model is placed in models folder

class WineController extends GetxController {
  RxList<Wine> wines = <Wine>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWines();
  }

  Future<void> loadWines() async {
    try {
      // Loading JSON from assets
      final String response = await rootBundle.loadString('assets/data/v3.json');
      final Map<String, dynamic> data = json.decode(response);
      final List winesData = data['carousel'];

      // Map the JSON data to the Wine model
      wines.assignAll(
        winesData.map((wineJson) => Wine.fromJson(wineJson)).toList(),
      );
    } catch (e) {
      print("Error loading wines data: $e");
    }
  }
}
