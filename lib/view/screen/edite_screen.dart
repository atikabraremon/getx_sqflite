import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/component/custom_text_from_field.dart';
import 'package:getx_sqflite/controller/controller.dart';

class EditeScreen extends StatefulWidget {
  const EditeScreen(
      {super.key, this.id, this.title, this.description, this.time});
  final int? id;
  final String? title;
  final String? description;
  final String? time;

  @override
  State<EditeScreen> createState() => _EditeScreenState();
}

class _EditeScreenState extends State<EditeScreen> {
  final titleController = TextEditingController();

  final timeController = TextEditingController();

  final descriptionController = TextEditingController();

  final SQLController controller = Get.find();

  @override
  void initState() {
    if(controller.updateTaskData){
      titleController.text = widget.title.toString();
      descriptionController.text = widget.description.toString();
      timeController.text = widget.time.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.updateTaskData ? "UPDATE DATA" : "ADD DATA"),
      ),
      body: Column(
        children: [
          CustomTextFromField(
              validation: "The title must have a value",
              controller: titleController),
          CustomTextFromField(
              validation: "The time must have a value",
              controller: timeController),
          CustomTextFromField(
              validation: "The title must have a value",
              controller: descriptionController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              onPressed: () {
                controller.updateTaskData
                    ? controller.updateData(
                        id: widget.id!,
                        title: titleController.text,
                        description: descriptionController.text,
                        time: timeController.text)
                    : controller.insertData(
                        title: titleController.text,
                        description: descriptionController.text,
                        time: timeController.text);
              },
              color: Colors.red,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child:
                  Text(controller.updateTaskData ? "UPDATE DATA" : "ADD DATA"),
            ),
          )
        ],
      ),
    );
  }
}
