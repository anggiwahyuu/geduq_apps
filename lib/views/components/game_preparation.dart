// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/game_controller.dart';
import 'package:geduq_apps/database/user_controller.dart';
import 'package:get/get.dart';

class GamePreparation extends StatelessWidget {
  GamePreparation({super.key, required this.isVisible});
  final GameController controller = Get.put(GameController());

  final UserController userController = Get.put(UserController());

  var isVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Visibility(
        visible: isVisible.value,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(95, 0, 0, 0)
          ),
          child: Center(
            child: Card(
              color: Colors.white,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.3,
                height: MediaQuery.of(context).size.height / 1.1,
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: const Icon(
                            Icons.close,
                            size: 40,
                          ),
                          onTap: () {
                            isVisible.value = false;
                          },
                        )
                      ),
          
                      const Text(
                        "PILIH KARAKTERMU!",
                        style: TextStyle(
                          fontSize: 22,
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
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset("assets/images/ulil_main.png"),
          
                                      Container(
                                        decoration: BoxDecoration(
                                          color: controller.character.value == "Ulil" ? const Color.fromARGB(69, 139, 139, 139) : Colors.transparent
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    controller.character.value = "Ulil";
                                  },
                                )
                              ),
          
                              const VerticalDivider(
                                width: 4,
                                color: Colors.black,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
          
                              Expanded(
                                child: InkWell(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset("assets/images/albab_main.png"),
          
                                      Container(
                                        decoration: BoxDecoration(
                                          color: controller.character.value == "Albab" ? const Color.fromARGB(69, 139, 139, 139) : Colors.transparent
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    controller.character.value = "Albab";
                                  },
                                )
                              )
                            ],
                          ),
                        ),
                      ),
          
                      Form(
                        key: controller.formKey.value,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                validator: (value){
                                  if (value!.isEmpty) {
                                    return 'Pastikan Nama tidak kosong!';
                                  } else if (value.length > 20) {
                                    return 'Username tidak boleh lebih dari 10 huruf!';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                controller: controller.username.value,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: "Masukkan Nama",
                                ),
                              ),
                            ),
          
                            const SizedBox(height: 20,),
          
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                ),
                                onTap: () {
                                  if (controller.formKey.value.currentState!.validate()) {
                                    if (controller.character.value == "") {
                                      AlertDialog alert = AlertDialog(
                                        title:  const Text("Peringatan", style: TextStyle(fontWeight: FontWeight.bold),),
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
                                      if (userController.userList.isNotEmpty) {
                                        for (int i = 0; i < userController.userList.length; i++) {
                                          if (controller.username.value.text == userController.userList[i].username) {
                                            AlertDialog alert = AlertDialog(
                                              title:  const Text("Peringatan", style: TextStyle(fontWeight: FontWeight.bold),),
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
                                            isVisible.value = false;
                                            controller.currentUsername.value = controller.username.value.text;
                                            Get.toNamed("/stage_select");
                                          }
                                        }
                                      } else {
                                        isVisible.value = false;
                                        controller.currentUsername.value = controller.username.value.text;
                                        Get.toNamed("/stage_select");
                                      }
                                    }
                                  }
                                  return;
                                },
                              ),
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}