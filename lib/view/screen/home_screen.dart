import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/view/screen/edite_screen.dart';
import 'package:getx_sqflite/view/widget/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SQLController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          IconButton(
            onPressed: () {
              // controller.insertData();
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        // backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.updateTaskData = false;
          Get.to(() => EditeScreen(), transition: Transition.downToUp);
        },
      ),
      body: GetBuilder<SQLController>(
        builder: (controller) => ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) =>
              TodoItem(controller: controller, index: index),
        ),
      ),
    );
  }
}
