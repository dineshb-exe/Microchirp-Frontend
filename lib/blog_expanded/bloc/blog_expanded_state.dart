part of 'blog_expanded_bloc.dart';

@immutable
abstract class BlogExpandedState {}

class BlogExpandedInitial extends BlogExpandedState {}

class BlogLoadedSuccessState extends BlogExpandedState {
  GlobalBlogModel blog;
  bool isLiked;
  List<dynamic> comments;
  BlogLoadedSuccessState({required this.blog,required this.isLiked, required this.comments});
}

class BlogErrorState extends BlogExpandedState {}