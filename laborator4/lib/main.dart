import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CleanArchitecture/Presentation/Controller/wine_controller.dart';
import 'CleanArchitecture/Presentation/ShopPage.dart'; // Import ShopPage
import 'package:device_preview/device_preview.dart';

void main() {
  // Inițializează dependențele cu Get
  Get.put(WineController());

  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wine Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShopPage(), // Utilizează ShopPage ca pagina principală
    );
  }
}
