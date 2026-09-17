import 'package:get/get.dart';

class TebakSurahController extends GetxController {
  int? selectedIndex;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  String answer = "";

  void setAnswer(String value) {
    answer = value;
    update();
  }

  bool isChoose = false;

  void setIsChoose(bool value) {
    isChoose = value;
    update();
  }

  String expressionCharaImg = "";

  void setExpressionCharaImg(String value) {
    expressionCharaImg = value;
    update();
  }

  bool isCorrect = false;

  void setIsCorrect(bool value) {
    isCorrect = value;
    update();
  }

  bool isAnswer = false;

  void setIsAnswer(bool value) {
    isAnswer = value;
    update();
  }
}
