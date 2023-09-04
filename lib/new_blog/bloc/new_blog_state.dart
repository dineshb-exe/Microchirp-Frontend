part of 'new_blog_bloc.dart';

@immutable
abstract class NewBlogState {}

class NewBlogInitial extends NewBlogState {}

class NewBlogInitialState extends NewBlogState {}

abstract class NewBlogActionState extends NewBlogState {}

class NewBlogDraftedState extends NewBlogActionState {}

class NewBlogPostedActionState extends NewBlogActionState {}

class NewBlogPostedErrorActionState extends NewBlogActionState {}


class NewBlogNavigateToHomeActionState extends NewBlogActionState {
  final PostLogin authValues;
  NewBlogNavigateToHomeActionState({required this.authValues});
}

class NewBlogNavigateToSearchBlogsActionState extends NewBlogActionState {}

class NewBlogNavigateToProfileActionState extends NewBlogActionState {}