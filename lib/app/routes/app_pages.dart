// ignore_for_file: constant_identifier_names

import 'package:geduq_apps/app/modules/about/bindings/about_binding.dart';
import 'package:geduq_apps/app/modules/about/views/about_view.dart';
import 'package:geduq_apps/app/modules/gameplay/bindings/gameplay_binding.dart';
import 'package:geduq_apps/app/modules/gameplay/views/gameplay_view.dart';
import 'package:geduq_apps/app/modules/home/bindings/home_binding.dart';
import 'package:geduq_apps/app/modules/home/views/home_view.dart';
import 'package:geduq_apps/app/modules/materi/bindings/materi_binding.dart';
import 'package:geduq_apps/app/modules/materi/views/materi_view.dart';
import 'package:geduq_apps/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:geduq_apps/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: _Paths.GAMEPLAY,
      page: () => const GameplayView(),
      binding: GameplayBinding(),
    ),
  ];
}
