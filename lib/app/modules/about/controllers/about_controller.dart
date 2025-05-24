import 'package:get/get.dart';

class AboutController extends GetxController {
  bool visible = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;

  setVisible() {
    visible = !visible;
    update();
  }

  setVisible2() {
    visible2 = !visible2;
    update();
  }

  setVisible3() {
    visible3 = !visible3;
    update();
  }

  setVisible4() {
    visible4 = !visible4;
    update();
  }
}
