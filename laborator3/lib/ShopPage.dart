import 'package:flutter/material.dart';
import 'components/HeaderSection.dart';
import 'components/SearchField.dart';
import 'components/CategorySection.dart';
import 'components/SubCategorySection.dart';
import 'controllers/wines_controller.dart';
import 'package:get/get.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            const SizedBox(height: 20),
            SubCategorySection(
              selectedCategory: selectedCategory,
            ),
          ],
        ),
      ),
    );
  }
}
