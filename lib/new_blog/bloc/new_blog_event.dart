part of 'new_blog_bloc.dart';

@immutable
abstract class NewBlogEvent {}

class NewBlogInitialEvent extends NewBlogEvent {}

class NewBlogPostButtonClickedEvent extends NewBlogEvent {
  final PostLogin authValues;
  String blogContent;
  NewBlogPostButtonClickedEvent({required this.authValues, required this.blogContent});
}

class NewBlogHomeNavigateEvent extends NewBlogEvent {
  final PostLogin authValues;
  NewBlogHomeNavigateEvent({required this.authValues});
}

class NewBlogSearchBlogsNavigateEvent extends NewBlogEvent {
  final PostLogin authValues;
  NewBlogSearchBlogsNavigateEvent({required this.authValues});
}