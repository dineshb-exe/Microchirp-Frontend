import 'package:dio/dio.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

class NewBlogServices {
  Future<Map<String,dynamic>> postNewBlog(PostLogin authValues, String blogContent) async{
    print("HI DA");
    final dio = Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8086',
          headers: {
            'token_header_key': authValues.jwtValue
          }
      ),
    );
    final response = await dio.post(
      '/newBlog',
      data: {
        'user_id': authValues.userID,
        'blog_content': blogContent
      }
    );
    print("PO DA");
    return response.data;
  }
}