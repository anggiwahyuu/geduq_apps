import 'package:geduq_apps/app/modules/gameplay/controllers/gameplay_controller.dart';
import 'package:get/get.dart';

class GameplayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameplayController>(() => GameplayController());
  }
}
