import 'pre_login_model.dart';
import 'package:dio/dio.dart';

class LoginServices{
  Future<Map<String,dynamic>> loginCheck(PreLogin credentials) async{
    final dio = Dio();
    print("Username: ${credentials.username}");
    final response = await dio.post(
      'http://10.0.2.2:8086/login',
      data: credentials.toJson()
    );
    return response.data;
  }
}