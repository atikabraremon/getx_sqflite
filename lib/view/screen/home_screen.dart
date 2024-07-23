import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          IconButton(onPressed: (){
            controller.deleteTheData();
          }, icon: const Icon(Icons.remove))
        ],
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
    );
  }
}
