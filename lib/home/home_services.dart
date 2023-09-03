import 'package:dio/dio.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

class HomeServices {
  Future<Map<String,dynamic>> feedBlogs(PostLogin authValues) async{
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
        'substring': "",
      },
    );
    return response.data;
  }
  Future<Map<String,dynamic>> recordLike(PostLogin authValues, GlobalBlogModel blog) async{
    final dio =Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8086',
          headers: {
            'token_header_key': authValues.jwtValue
          }
      ),
    );
    final response = await dio.put(
      '/like',
      data: {
        "user_id": authValues.userID,
        "blog_id": blog.blog_id,
      }
    );
    return response.data;
  }
}