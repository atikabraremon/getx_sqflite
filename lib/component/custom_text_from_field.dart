import 'package:flutter/material.dart';



class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({super.key, required this.validation, required this.controller});
  final TextEditingController controller;
  final String validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return validation;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
      ),
    );
  }
}
