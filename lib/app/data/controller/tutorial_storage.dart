import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TutorialStorage extends GetxController {
  final box = GetStorage();

  bool isVisible = true;

  @override
  void onInit() {
    super.onInit();
    getVisibilityStatus();
  }

  void getVisibilityStatus() {
    bool? storedVisibility = box.read("isVisible");

    if (storedVisibility != null) {
      isVisible = storedVisibility;
    }

    update();
  }

  void hideTutorial() {
    isVisible = false;
    box.write("isVisible", false);
    update();
  }

  void visibleTutorial() {
    isVisible = true;
    update();
  }
}
