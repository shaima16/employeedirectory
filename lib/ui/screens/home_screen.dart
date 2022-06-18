import 'package:employeedirectory/controllers/employee_controller.dart';
import 'package:employeedirectory/ui/screens/theme/my_colors.dart';
import 'package:employeedirectory/ui/screens/theme/text_style.dart';
import 'package:employeedirectory/ui/screens/widget/common_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final EmployeeController employeeController = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      child: SafeArea(
        child: Center(
          child: GetBuilder<EmployeeController>(
              builder: (employeeController) => _employeeTransactionList()),
        ),
      ),
    );
  }

  _employeeTransactionList() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        searchWidget(),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: employeeController.employeeHeader == null
                ? 0
                : employeeController.employeeHeader.length,
            itemBuilder: (context, index) {
              return employeeListBlock(index);
            },
          ),
        )
      ],
    );
  }

  Widget employeeListBlock(int index) {
    return InkWell(onTap: (){
      Get.to(()=>{
        DetailsScreen(index:index)
      });
    },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: employeeController.employeeHeader[index]
                                ['profileImage'] !=
                            null
                        ? Image.network(
                            "${employeeController.employeeHeader[index]['profileImage']}",
                            fit: BoxFit.fill,
                          )
                        : const Icon(Icons.person)),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      "${employeeController.employeeHeader[index]['name']}",
                      style: bold12TextField,
                    ),
                    Text(
                      "${employeeController.employeeHeader[index]['companyName']}",
                      style: regular14TextField,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchWidget() {
    return TextFormField(
      onTap: () {},
      onChanged: (val) {
        employeeController.loadList(val);
      },
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        fontSize: 13,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        fillColor: MyColors.backgroundWhite,
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: "search".tr,
        focusColor: MyColors.backgroundBlack,
      ),
      autofocus: true,
    );
  }
}
