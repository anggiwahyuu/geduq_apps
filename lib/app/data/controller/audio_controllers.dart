import 'package:flutter/material.dart';
import 'package:geduq_apps/app/data/utils/sound_helper.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController with WidgetsBindingObserver {
  final AudioPlayer backgroundPlayer = AudioPlayer();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();
  bool isPlaying = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    _audioCache.load(SoundHelper.soundBacksoundGameMp3);
    playBackgroundSound(0.5);
  }

  Future<void> playBackgroundSound(double volume) async {
    backgroundPlayer.setReleaseMode(ReleaseMode.loop);
    await backgroundPlayer.play(AssetSource(SoundHelper.soundBacksoundGameMp3), volume: volume);
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

  Future<void> stopSound() async {
    await _audioPlayer.stop();
    isPlaying = false;
  }

  Future<void> pauseBackgroundSound() async {
    await backgroundPlayer.pause();
  }

  Future<void> stopBackgroundSound() async {
    await backgroundPlayer.stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive || state == AppLifecycleState.hidden) {
      backgroundPlayer.pause();
    } else {
      if (Get.isRegistered<HomeController>()) {
        final homeCtrl = Get.find<HomeController>();
        if (homeCtrl.isCanPauseBackgroundAudio) {
          pauseBackgroundSound();
        } else {
          playBackgroundSound(0.5);
        }
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
