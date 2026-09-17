import 'package:get/get.dart';

class SusunAyatController extends GetxController {
  int? selectedIndex;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  List<String> answer = [];

  void setAnswer(String value) {
    answer.insert(0, value);
    update();
  }

  void deleteAnswer(int index) {
    answer.removeAt(index);
    update();
  }

  int correctAnswer = 0;

  void setAddOrReduceCorrectAnswer({required bool isAdd}) {
    if (isAdd) {
      correctAnswer++;
    } else {
      correctAnswer--;
    }
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
