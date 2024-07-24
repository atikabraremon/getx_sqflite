import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/view/screen/edite_screen.dart';
import 'package:path/path.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.controller, required this.index});
  final SQLController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: Text(controller.dataList[index].title),
                  ),
                  Expanded(
                    child: Text(controller.dataList[index].time),
                  ),
                ],
              )),
              Expanded(
                child: Text(controller.dataList[index].description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.deleteData(id: controller.dataList[index].id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.updateTaskData = true;
                      Get.to(
                          () => EditeScreen(
                                title: controller.dataList[index].title,
                                description:
                                    controller.dataList[index].description,
                                time: controller.dataList[index].time,
                                id: controller.dataList[index].id,
                              ),
                          transition: Transition.rightToLeft);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
