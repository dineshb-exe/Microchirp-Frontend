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
    on<BlogExpandedCommentPostingEvent>(blogExpandedCommentPostingEvent);
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

  FutureOr<void> blogExpandedCommentPostingEvent(BlogExpandedCommentPostingEvent event, Emitter<BlogExpandedState> emit) async {
    List<dynamic> comments = event.comments;
    CommentsModel commentsModel = CommentsModel(
      user_id: event.authValues.userID,
      display_title: "You just added",
      blog_id: event.blog.blog_id,
      comment_content: event.comment,
    );
    comments.add(commentsModel.toJson());
    BlogExpandedServices blogExpandedServices = BlogExpandedServices();
    var response = await blogExpandedServices.postNewComment(event.authValues, event.blog, event.comment);
    if(response['status']=="Success"){
      emit(BlogLoadedSuccessState(
        blog: event.blog,
        isLiked: event.isLiked,
        comments: comments,
      ));
    }
  }
}
