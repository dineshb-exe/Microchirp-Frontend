import 'package:dio/dio.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

class SearchBlogsServices{
  Future<Map<String,dynamic>> searchBlogsFeed(PostLogin authValues, String subStringValue) async{
    final dio =Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8086',
          headers: {
            'token_header_key': authValues.jwtValue
          }
      ),
    );
    final response = await dio.get(
      '/fetchBlogs',
      queryParameters: {
        'user_id': "",
        'substring': subStringValue,
      },
    );
    return response.data;
  }
}