

import 'package:employeedirectory/services/http_services.dart';

import '../model/employee_model.dart';

class HomeRepository {
  HttpHelper http = HttpHelper();
  Future<List<EmployeeModel>> getHome() async {
    final response =
        await http.get("http://www.mocky.io/v2/5d565297300000680030a986");
    return employeeModelFromJson(response.body);
  }

Future<dynamic> fetchEmployee() async {
  var response = await http.get("http://www.mocky.io/v2/5d565297300000680030a986");
  if (response.runtimeType.toString() == 'Response') {
    EmployeeModel data =
    EmployeeModel.fromJson(response.body);
    return data;
  }
  return response;
}}