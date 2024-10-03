// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/materi_controller.dart';
import 'package:get/get.dart';

class MateriDoa extends StatelessWidget {
  MateriDoa({super.key, required this.isMateriVisible});

  final MateriController materiController = Get.put(MateriController());

  var isMateriVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (materiController.itemDoa.isNotEmpty) {
        return Visibility(
          visible: isMateriVisible.value,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(95, 0, 0, 0)
            ),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 1.2,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 225, 136, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        materiController.itemDoa[materiController.randomPickDoa]["title"],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                              
                      Column(
                        children: [
                          Text(
                            materiController.itemDoa[materiController.randomPickDoa]["doa_arabic"],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              materiController.itemDoa[materiController.randomPickDoa]["doa_latin"],
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Artinya: ",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                            
                                  TextSpan(
                                    text: materiController.itemDoa[materiController.randomPickDoa]["meaning"]
                                  )
                                ]
                              )
                            ),
                          ),
                        ],
                      ),
            
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            isMateriVisible.value = false;
                            materiController.readMateriJson();
                          }, 
                          icon: const Icon(
                            Icons.keyboard_double_arrow_right,
                            size: 30,
                            color: Colors.black,
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}