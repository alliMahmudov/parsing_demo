import 'package:parsing_demo/model/user_model.dart';

class EmpOne {
  String status = '';
  String message = '';
  late User data;

  EmpOne.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = User.fromJson(json['data']);

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data.toJson()};
}
