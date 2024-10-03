import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GameController extends GetxController {
  final pages = "".obs;
  
  final userId = (-1).obs;
  final character = "".obs;
  final currentUsername = "".obs;
  final currentLevel = 1.obs;
  final lifePoint = 5.obs;
  final totalTimePreTest = 0.obs;

  final username = TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;

  final stageSambungAyatDone = [].obs;
  final stageSusunAyatDone = [].obs;
  final stageTebakArtiDone = [].obs;
  final stageTebakSurahDone = [].obs;
  final stageTebakArtiAyatDone = [].obs;

  final stagePostTestDone = [].obs;

  final levelOneIsDone = false.obs;
  final levelTwoIsDone = false.obs;
  final levelThreeIsDone = false.obs;
  final levelFourIsDone = false.obs;
  final levelFiveIsDone = false.obs;
  final levelSixIsDone = false.obs;
  final levelSevenIsDone = false.obs;
  final levelEightIsDone = false.obs;
  final levelNineIsDone = false.obs;
  final levelTenIsDone = false.obs;

  final levelOneIsCorrect = false.obs;
  final levelTwoIsCorrect = false.obs;
  final levelThreeIsCorrect = false.obs;
  final levelFourIsCorrect = false.obs;
  final levelFiveIsCorrect = false.obs;
  final levelSixIsCorrect = false.obs;
  final levelSevenIsCorrect = false.obs;
  final levelEightIsCorrect = false.obs;
  final levelNineIsCorrect = false.obs;
  final levelTenIsCorrect = false.obs;

  final materiOneIsOpen = false.obs;
  final materiTwoIsOpen = false.obs;
  final materiThreeIsOpen = false.obs;
  final materiFourIsOpen = false.obs;
  final materiFiveIsOpen = false.obs;
  final materiSixIsOpen = false.obs;
  final materiSevenIsOpen = false.obs;
  final materiEightIsOpen = false.obs;
  final materiNineIsOpen = false.obs;
  final materiTenIsOpen = false.obs;
  final materiElevenIsOpen = false.obs;

  final scorePreTest = 0.obs;
}