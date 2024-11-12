import 'package:flutter/material.dart';
import 'components/HeaderSection.dart';
import 'components/SearchField.dart';
import 'components/CategorySection.dart';
import 'components/SubCategorySection.dart';
import 'controllers/wines_controller.dart';
import 'package:get/get.dart';
import './controllers/wines.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedCategory = 'white';

  @override
  void initState() {
    super.initState();
    Get.put(WineController()); // Initialize the WineController
  }

void updateCategory(String newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final WineController wineController = Get.find<WineController>();
    List<Wine> filteredWines = selectedCategory.isEmpty
          ? wineController.wines // Show all wines if no category selected
          : wineController.wines
              .where((wine) =>
                  wine.type.toLowerCase() == selectedCategory.toLowerCase())
              .toList();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            const SearchField(),
            const SizedBox(height: 20),
            CategorySection(
              selectedCategory: selectedCategory,
              dataMap: filteredWines,
              updateCategory: updateCategory,
            ),
            SubCategorySection(
              selectedCategory: selectedCategory,
            ),
          ],
        ),
      ),
    );
  }
}
