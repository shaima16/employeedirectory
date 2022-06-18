import 'package:employeedirectory/controllers/employee_controller.dart';
import 'package:employeedirectory/ui/screens/theme/text_style.dart';
import 'package:employeedirectory/ui/screens/widget/common_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  final EmployeeController employeeController = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      child: SafeArea(
        child: Center(
          child: GetBuilder<EmployeeController>(
              builder: (employeeController) => employeeListBlock()),
        ),
      ),
    );
  }

  Widget employeeListBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 200,
                child: employeeController.employeeHeader[index]
                            ['profileImage'] !=
                        null
                    ? Image.network(
                        "${employeeController.employeeHeader[index]['profileImage']}",
                        fit: BoxFit.fill,
                      )
                    : const Icon(Icons.person),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name:${employeeController.employeeHeader[index]['name']}",
                    style: bold12TextField,
                  ),
                  Text(
                    "Username: ${employeeController.employeeHeader[index]['username']}",
                    style: regular14TextField,
                  ),
                  Text(
                    "Email: ${employeeController.employeeHeader[index]['email']}",
                    style: regular14TextField,
                  ),
                  Text(
                    "Address: ${employeeController.employeeHeader[index]['street']},"
                    "${employeeController.employeeHeader[index]['suite']},"
                    "${employeeController.employeeHeader[index]['city']},"
                    "${employeeController.employeeHeader[index]['zipcode']},"
                    "${employeeController.employeeHeader[index]['companyName']}",
                    style: regular14TextField,
                  ),
                  Text(
                    "Phone: ${employeeController.employeeHeader[index]['phone']}",
                    style: regular14TextField,
                  ),
                  Text(
                    "Website: ${employeeController.employeeHeader[index]['website']}",
                    style: regular14TextField,
                  ),
                  Text(
                    "CompanyName: ${employeeController.employeeHeader[index]['companyName']}",
                    style: regular14TextField,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
