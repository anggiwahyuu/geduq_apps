import 'package:get/get.dart';

class AboutController extends GetxController {
  bool visible = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;

  void setVisible() {
    visible = !visible;
    update();
  }

  void setVisible2() {
    visible2 = !visible2;
    update();
  }

  void setVisible3() {
    visible3 = !visible3;
    update();
  }

  void setVisible4() {
    visible4 = !visible4;
    update();
  }
}
