import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/config/task_bindings.dart';
import 'package:getx_sqflite/view/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx SQFLite',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: TaskBindings(),
      home:  HomeScreen(),
    );
  }
}