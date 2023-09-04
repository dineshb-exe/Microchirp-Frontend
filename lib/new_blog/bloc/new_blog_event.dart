part of 'new_blog_bloc.dart';

@immutable
abstract class NewBlogEvent {}

class NewBlogInitialEvent extends NewBlogEvent {}

class NewBlogPostButtonClickedEvent extends NewBlogEvent {
  PostLogin authValues;
  String blogContent;
  NewBlogPostButtonClickedEvent({required this.authValues, required this.blogContent});
}

class NewBlogHomeNavigateEvent extends NewBlogEvent {
  PostLogin authValues;
  NewBlogHomeNavigateEvent({required this.authValues});
}