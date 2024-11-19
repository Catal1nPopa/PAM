import 'package:flutter/material.dart';

class Cardfilter extends StatelessWidget {
  final String selectedCategory;
  final Map<String, List<Map<String, dynamic>>> dataMap;
  final Function(String) onItemSelected;

  const Cardfilter({
    Key? key,
    required this.selectedCategory,
    required this.dataMap,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get data for the selected category
    List<Map<String, dynamic>> data = dataMap[selectedCategory] ?? [];

    if (data.isEmpty) {
      return const Center(
        child: Text("No data available for this category"),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.map((item) {
          // Display only the first unique item for each category
          return InkWell(
            onTap: () => onItemSelected(item[selectedCategory] ?? ''),
            child: Container(
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Container(
                      height: 125,
                      child: Image.network(
                        item['image'] ?? 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  // Cantitate
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Quantity: ${item['cantitate']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Type or Country
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      selectedCategory == 'type'
                          ? 'Type: ${item['type']}'
                          : 'Country: ${item['country']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
