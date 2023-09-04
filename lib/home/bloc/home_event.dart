part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  PostLogin authValues;
  HomeInitialEvent({required this.authValues});
}

class HomeBlogNavigateEvent extends HomeEvent {
  final GlobalBlogModel blogs;
  final bool isLiked;
  PostLogin authValues;
  HomeBlogNavigateEvent({required this.isLiked, required this.blogs, required this.authValues});
}

class HomeBlogLikeClickedEvent extends HomeEvent {
  PostLogin authValues;
  final GlobalBlogModel clickedBlog;
  HomeBlogLikeClickedEvent({required this.authValues, required this.clickedBlog});
}

class HomeSearchBlogsNavigateEvent extends HomeEvent {}

class HomeNewBlogNavigateEvent extends HomeEvent {
  PostLogin authValues;
  HomeNewBlogNavigateEvent({required this.authValues});
}

class HomeProfileNavigateEvent extends HomeEvent {}