// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/controllers/materi_controller.dart';
import 'package:get/get.dart';

class MateriSKI extends StatelessWidget {
  MateriSKI({super.key, required this.isMateriVisible});

  final MateriController materiController = Get.put(MateriController());

  var isMateriVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (materiController.itemSejarah.isNotEmpty) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sejarah Kebudayaan Islam",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                              
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: "${materiController.itemSejarah[materiController.randomPickSejarah]["title"]} ",
                              style: const TextStyle(fontWeight: FontWeight.bold)
                            ),
            
                            TextSpan(
                              text: materiController.itemSejarah[materiController.randomPickSejarah]["information"]
                            )
                          ],
                        )
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