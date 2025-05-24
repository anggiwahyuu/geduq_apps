import 'package:get/get.dart';

class SusunAyatController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  int? selectedIndex;

  setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  List<String> answer = [];

  setAnswer(String value) {
    answer.insert(0, value);
    update();
  }

  deleteAnswer(int index) {
    answer.removeAt(index);
    update();
  }

  int correctAnswer = 0;

  setAddOrReduceCorrectAnswer({required bool isAdd}) {
    if (isAdd) {
      correctAnswer++;
    } else {
      correctAnswer--;
    }
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
