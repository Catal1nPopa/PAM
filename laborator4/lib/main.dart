// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:laborator2/ShopPage.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       home: const ShopPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CleanArchitecture/Application/Controllers/wine_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WinePage(),
    );
  }
}

class WinePage extends StatelessWidget {
  final WineController wineController = Get.put(WineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wine Carousel')),
      body: Obx(() {
        if (wineController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Afișează lista `winesBy`
            Text('Wines By:'),
            Expanded(
              child: ListView.builder(
                itemCount: wineController.winesBy.length,
                itemBuilder: (context, index) {
                  final wine = wineController.winesBy[index];
                  return ListTile(
                    title: Text(wine.name),
                    subtitle: Text(wine.tag),
                  );
                },
              ),
            ),
            Divider(),
            // Afișează carousel-ul
            Text('Carousel:'),
            Expanded(
              child: ListView.builder(
                itemCount: wineController.carousel.length,
                itemBuilder: (context, index) {
                  final item = wineController.carousel[index];
                  return ListTile(
                    leading: Image.network(item.image, width: 50, height: 50),
                    title: Text(item.name),
                    subtitle: Text('${item.from.country}, ${item.from.city}'),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
