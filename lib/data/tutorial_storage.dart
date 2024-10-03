import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TutorialStorage extends GetxController {
  final box = GetStorage();

  final isVisible = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    getVisibilityStatus();
  }

  void getVisibilityStatus() {
    bool? storedVisibility = box.read("isVisible");

    if (storedVisibility != null) {
      isVisible.value = storedVisibility;
    }
  }

  void visibleTutorial() {
    isVisible.value = true;
  }
}