import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/sqlite/user_controller.dart';
import 'package:geduq_apps/app/data/utils/image_helper.dart';
import 'package:geduq_apps/app/modules/home/controllers/home_controller.dart';
import 'package:geduq_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GamePreparation extends StatelessWidget {
  GamePreparation({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                  width: 1.sw * 0.5,
                  height: 155.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Icon(
                            Icons.close,
                            size: 20.w,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Text(
                        "PILIH KARAKTERMU!",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          width: 1.sw,
                          height: 1.sh * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: InkWell(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(ImageHelper.imgUlilMainPng),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: _.character == "Ulil"
                                              ? const Color.fromARGB(69, 139, 139, 139)
                                              : Colors.transparent),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  _.setCharacter("Ulil");
                                },
                              )),
                              VerticalDivider(
                                width: 4,
                                color: Colors.black,
                                thickness: 2,
                                indent: 2.w,
                                endIndent: 2.w,
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(ImageHelper.imgAlbabMainPng),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: _.character == "Albab"
                                                ? const Color.fromARGB(69, 139, 139, 139)
                                                : Colors.transparent),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    _.setCharacter("Albab");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Pastikan Nama tidak kosong!';
                                } else if (value.length > 20) {
                                  return 'Username tidak boleh lebih dari 10 huruf!';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              controller: _.username,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "Masukkan Nama",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              child: Icon(
                                Icons.play_arrow,
                                size: 25.w,
                              ),
                              onTap: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  if (_.character == "") {
                                    AlertDialog alert = AlertDialog(
                                      title: const Text(
                                        "Peringatan",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      content: const SizedBox(
                                        child: Text("Pilih Karaktermu Dahulu!!"),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    );

                                    showDialog(context: context, builder: (context) => alert);
                                  } else {
                                    final UserController userCtrl = Get.find();
                                    if (userCtrl.userList.isNotEmpty) {
                                      for (int i = 0; i < userCtrl.userList.length; i++) {
                                        if (_.username.text == userCtrl.userList[i].username) {
                                          AlertDialog alert = AlertDialog(
                                            title: const Text(
                                              "Peringatan",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            content: const SizedBox(
                                              child: Text("Username sudah ada. Cobalah menggunakan Username yang lain"),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Get.back(),
                                                child: const Text("OK"),
                                              ),
                                            ],
                                          );

                                          showDialog(context: context, builder: (context) => alert);
                                        } else {
                                          _.setCurrentUsername(_.username.text);
                                          Get.toNamed(Routes.GAMEPLAY);
                                        }
                                      }
                                    } else {
                                      _.setCurrentUsername(_.username.text);
                                      Get.toNamed(Routes.GAMEPLAY);
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
