part of 'search_blogs_bloc.dart';

@immutable
abstract class SearchBlogsState {}

class SearchBlogsInitial extends SearchBlogsState {}

class SearchBlogsInitialState extends SearchBlogsState {}

class SearchBlogsLoadingState extends SearchBlogsState {}

class SearchBlogsLoadedSuccessState extends SearchBlogsState {
  final PostLogin authValues;
  final List<dynamic> blogs;
  SearchBlogsLoadedSuccessState({required this.authValues, required this.blogs});
}

abstract class SearchBlogsActionState extends SearchBlogsState {}

class SearchBlogsErrorActionState extends SearchBlogsActionState {}

class SearchNavigateToHomeActionState extends SearchBlogsActionState {
  final PostLogin authValues;
  SearchNavigateToHomeActionState({required this.authValues});
}

class SearchNavigateToNewBlogActionState extends SearchBlogsActionState {
  final PostLogin authValues;
  SearchNavigateToNewBlogActionState({required this.authValues});
}