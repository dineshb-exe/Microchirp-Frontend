import 'package:dio/dio.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

class BlogExpandedServices{
  Future<Map<String,dynamic>> fetchCommentsService(PostLogin authValues, GlobalBlogModel blog) async{
    final dio = Dio(
      BaseOptions(
          baseUrl: 'http://10.0.2.2:8086',
          headers: {
            'token_header_key': authValues.jwtValue
          }
      )
    );
    var response = await dio.get(
      '/fetchComments',
      queryParameters: {
        'blog_id': blog.blog_id,
      },
    );
    return response.data;
  }
  Future<Map<String,dynamic>> postNewComment(PostLogin authValues, GlobalBlogModel blog, String commentContent) async{
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
        '/newComment',
        data: {
          'user_id': authValues.userID,
          'blog_id': blog.blog_id,
          'comment_content': commentContent
        }
    );
    print("PO DA");
    return response.data;
  }
}