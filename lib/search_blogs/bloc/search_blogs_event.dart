part of 'search_blogs_bloc.dart';

@immutable
abstract class SearchBlogsEvent {}

class SearchBlogsInitialEvent extends SearchBlogsEvent {}

class SearchBlogsSearchClickedEvent extends SearchBlogsEvent {
  final PostLogin authValues;
  final String subStringValue;
  SearchBlogsSearchClickedEvent({required this.subStringValue, required this.authValues});
}

class SearchHomeNavigateEvent extends SearchBlogsEvent {
  final PostLogin authValues;
  SearchHomeNavigateEvent({required this.authValues});
}

class SearchNewBlogNavigateEvent extends SearchBlogsEvent {
  final PostLogin authValues;
  SearchNewBlogNavigateEvent({required this.authValues});
}