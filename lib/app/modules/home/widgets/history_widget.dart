import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geduq_apps/app/data/sqlite/user_controller.dart';
import 'package:get/get.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1.sw * 0.9,
                  height: 1.sh * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: const Color.fromRGBO(255, 225, 136, 1),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: _.userList.isEmpty
                            ? Center(
                                child: Text(
                                  "Data Kosong",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
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
                                      rows: _.userList.map((user) {
                                        return DataRow(cells: [
                                          DataCell(Text(user.id.toString())),
                                          DataCell(Text(user.username)),
                                          DataCell(Text(user.selectCharacter)),
                                          DataCell(Text(user.scorePreTest.toString())),
                                          DataCell(Text(user.timesPreTest.toString()))
                                        ]);
                                      }).toList()),
                                ),
                              ),
                      ),
                      Positioned(
                        top: 0.w,
                        right: 0.w,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
