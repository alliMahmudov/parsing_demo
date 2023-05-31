class User_delete {
  String? status;
  String? message;
  String? data;

  User_delete.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = json['data'];

  Map<String, dynamic> toJson() =>
      {'status': status, 'message': message, 'data': data};
}
