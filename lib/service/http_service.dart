import 'dart:convert';

import 'package:http/http.dart';
import 'package:parsing_demo/model/user_create.dart';
import 'package:parsing_demo/model/user_delete.dart';
import 'package:parsing_demo/model/user_update.dart';

import '../model/emp_one.dart';
import '../model/user_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  // Http Apis

  static String API_EMP_LIST = "/api/v1/employees";
  static String API_EMP_ONE = "/api/v1/employee/"; // {id}
  static String API_EMP_CREATE = "/api/v1/create";
  static String API_EMP_UPDATE = "/api/v1/update/"; // {id}
  static String API_EMP_DELETE = "/api/v1/delete/"; // {id}

  // Http Request

  // get request
  static Future<String?> GET(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // post request
  static Future<String?> POST(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // put request
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // delete request
  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Http Params //

  // empty params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  // create params
  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  // update params
  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = Map();
    params.addAll({'name': user.name, 'salary': user.salary, 'age': user.age});
    return params;
  }

  // Http Parsing //

  // parse get one
  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  // parse create
  static User_create parseUserCreate(String body) {
    dynamic json = jsonDecode(body);
    var data = User_create.fromJson(json);
    return data;
  }

  // parse update
  static User_update parseUserUpdate(String body) {
    dynamic json = jsonDecode(body);
    var data = User_update.fromJson(json);
    return data;
  }

  // parse delete
  static User_delete parseUserDelete(String body) {
    dynamic json = jsonDecode(body);
    var data = User_delete.fromJson(json);
    return data;
  }
}
