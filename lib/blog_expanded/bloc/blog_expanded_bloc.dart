import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microchirp_frontend/blog_expanded/blog_expanded_services.dart';
import 'package:microchirp_frontend/blog_expanded/comments_model.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

part 'blog_expanded_event.dart';
part 'blog_expanded_state.dart';

class BlogExpandedBloc extends Bloc<BlogExpandedEvent, BlogExpandedState> {
  BlogExpandedBloc() : super(BlogExpandedInitial()) {
    on<BlogExpandedInitialEvent>(blogExpandedInitialEvent);
  }

  FutureOr<void> blogExpandedInitialEvent(BlogExpandedInitialEvent event, Emitter<BlogExpandedState> emit) async{
    GlobalBlogModel blog = event.blog;
    bool isLiked = event.isLiked;
    PostLogin authValues = event.authValues;
    BlogExpandedServices blogExpandedServices = BlogExpandedServices();
    var responseValues = await blogExpandedServices.fetchCommentsService(authValues, blog);
    if(responseValues['status']=="Success"){
      emit(BlogLoadedSuccessState(
        blog: blog,
        isLiked: isLiked,
        comments: responseValues['data']
      ));
    }
  }
}
