import 'package:employeedirectory/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/employee_controller.dart';

void main() {
  final EmployeeController employeeController = Get.put(EmployeeController());
  employeeController. openEmployeeDb();

  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}