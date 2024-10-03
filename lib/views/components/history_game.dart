// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:geduq_apps/database/user_controller.dart';
import 'package:get/get.dart';

class HistoryGame extends StatelessWidget {
  HistoryGame({super.key, required this.isVisible});

  final UserController userController = Get.put(UserController());

  var isVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: isVisible.value,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(95, 0, 0, 0)
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.1,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 225, 136, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: userController.userList.isEmpty 
                  ? const Center(
                      child: Text("Data Kosong"),
                    )
                  : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text("No.")),
                          DataColumn(label: Text("Username")),
                          DataColumn(label: Text("Karakter")),
                          DataColumn(label: Text("Score")),
                          DataColumn(label: Text("Waktu"))
                        ], 
                        rows: userController.userList.map((user) {
                          return DataRow(cells: [
                            DataCell(Text(user.id.toString())),
                            DataCell(Text(user.username)),
                            DataCell(Text(user.selectCharacter)),
                            DataCell(Text(user.scorePreTest.toString())),
                            DataCell(Text(user.timesPreTest.toString()))
                          ]);
                        }).toList()
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    isVisible.value = false;
                  }, 
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 50,
                  )
                )
              ),
            ],
          ),
        ),
      );
    });
  }
}