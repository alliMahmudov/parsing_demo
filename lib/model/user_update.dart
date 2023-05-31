import 'package:parsing_demo/model/user_model.dart';

class User_update {
  String? status;
  String? message;
  late List<User> data;

  User_update.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = List<User>.from(json['data'].map((x) => User.fromJson(x)));

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
