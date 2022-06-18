import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../ui/screens/widget/dialog.dart';

class HttpHelper {
  Future<dynamic> get(String url) async {
    debugPrint(url);
    var responseJson;
    try {
      var response = await http.get(Uri.parse(url));

      responseJson = _returnResponse(response);

      // debugPrint(response.body);
    } on SocketException {
      showSnackBar(message: 'No internet connection');
    } catch (e) {
      debugPrint(" get $e");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) async {
    try {
      var responseBody = jsonDecode(response.body);
      // debugPrint("statuscode ${response.statusCode}");
      switch (response.statusCode) {
        case 200:
        case 201:
          return response;
        case 400:
          debugPrint('Error occurred');
          break;

        case 401:
          debugPrint('Error occurred');

          break;
        case 403:
          debugPrint('Error occurred');
          break;

        case 404:
          debugPrint('Error occurred');
          break;

        case 422:
          debugPrint('Error occurred');
          break;

        case 500:
          debugPrint('Error occurred');
          break;

        default:
          var responseJson = response.body;
        // debugPrint( responseJson.toString());
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
