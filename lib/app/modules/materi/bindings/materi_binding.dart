import 'package:geduq_apps/app/modules/materi/controllers/materi_controller.dart';
import 'package:get/get.dart';

class MateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriController>(() => MateriController());
  }
}
