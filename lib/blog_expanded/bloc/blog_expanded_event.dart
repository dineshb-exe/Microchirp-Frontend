part of 'blog_expanded_bloc.dart';

@immutable
abstract class BlogExpandedEvent {}

class BlogExpandedInitialEvent extends BlogExpandedEvent {
  bool isLiked;
  GlobalBlogModel blog;
  PostLogin authValues;
  BlogExpandedInitialEvent({required this.isLiked, required this.blog, required this.authValues});
}

class BlogExpandedLikeClickedEvent extends BlogExpandedEvent {
  PostLogin authValues;
  final GlobalBlogModel clickedBlog;
  BlogExpandedLikeClickedEvent({required this.authValues, required this.clickedBlog});
}

class BlogExpandedCommentPostingEvent extends BlogExpandedEvent {
  GlobalBlogModel blog;
  bool isLiked;
  List<dynamic> comments;
  String comment;
  PostLogin authValues;
  BlogExpandedCommentPostingEvent({required this.blog, required this.isLiked, required this.comments, required this.comment, required this.authValues});
}
