import 'package:get/get.dart';
import '../../Data/DataSource/local_data_source.dart';
import '../../Domain/Entities/carousel_entity.dart';
import '../../Domain/Entities/wines_entity.dart';

class WineController extends GetxController {
  final LocalDataSource _localDataSource = LocalDataSource();

  // Stările observabile
  var winesBy = <WinesEntity>[].obs;
  var carousel = <CarouselEntity>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading.value = true;
    try {
      // Încarcă datele din LocalDataSource
      final winesByData = await _localDataSource.fetchWinesBy();
      final carouselData = await _localDataSource.fetchCarousel();

      // Actualizează stările observabile
      winesBy.value = winesByData;
      carousel.value = carouselData;
    } catch (e) {
      Get.snackbar("Error", "Failed to load data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
