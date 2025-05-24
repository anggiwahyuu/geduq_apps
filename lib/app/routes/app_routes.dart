// ignore_for_file: unused_element, constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const HOME = _Paths.HOME;
  static const ABOUT = _Paths.ABOUT;
  static const MATERI = _Paths.MATERI;
  static const GAMEPLAY = _Paths.GAMEPLAY;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash-screen';
  static const HOME = '/home';
  static const ABOUT = '/about';
  static const MATERI = '/materi';
  static const GAMEPLAY = '/gameplay';
}
