import 'package:get/get.dart';

class TebakArtiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  int? selectedIndex;

  setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  String answer = "";

  setAnswer(String value) {
    answer = value;
    update();
  }

  bool isChoose = false;

  setIsChoose(bool value) {
    isChoose = value;
    update();
  }

  String expressionCharaImg = "";

  setExpressionCharaImg(String value) {
    expressionCharaImg = value;
    update();
  }

  bool isCorrect = false;

  setIsCorrect(bool value) {
    isCorrect = value;
    update();
  }

  bool isAnswer = false;

  setIsAnswer(bool value) {
    isAnswer = value;
    update();
  }
}
