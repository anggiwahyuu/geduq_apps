import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/controller/audio_controllers.dart';
import 'package:geduq_apps/app/data/controller/tutorial_storage.dart';
import 'package:geduq_apps/app/data/sqlite/user_controller.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AudioController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [],
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'GEDUQ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onInit: () async {
          Get.put<UserController>(UserController(), permanent: true);
          Get.put<AudioController>(AudioController(), permanent: true);
          Get.put<TutorialStorage>(TutorialStorage(), permanent: true);
        },
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
