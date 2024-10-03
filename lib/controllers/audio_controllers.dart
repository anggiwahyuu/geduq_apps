import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController with WidgetsBindingObserver {
  final GameController controller = Get.put(GameController());
  
  final AudioPlayer backgroundPlayer = AudioPlayer();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();
  bool isPlaying = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _audioCache.load("sounds/backsound_game.mp3");
    playBackgroundSound(0.5);
  }

  Future<void> playBackgroundSound(double volume) async {
    backgroundPlayer.setReleaseMode(ReleaseMode.loop);
    await backgroundPlayer.play(AssetSource("sounds/backsound_game.mp3"), volume: volume);
  }

  Future<void> playSound(String path) async {
    if (isPlaying) {
      await _audioPlayer.stop();
    }

    isPlaying = true;
    await _audioPlayer.play(AssetSource(path));

    _audioPlayer.onPlayerComplete.listen((event) {
      isPlaying = false;
    });
  }

  Future<void> stopBackgroundSound() async {
    await backgroundPlayer.stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive || state == AppLifecycleState.hidden) {
      backgroundPlayer.pause();
    } else {
      if (controller.pages.value == "/enter_house") {
        backgroundPlayer.pause();
      } else if (state == AppLifecycleState.resumed) {
        playBackgroundSound(0.5);
      }
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    backgroundPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}