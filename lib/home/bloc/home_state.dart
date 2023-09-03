part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

 class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
 final PostLogin authValues;
 final List<dynamic> blogs;
 HomeLoadedSuccessState({required this.authValues, required this.blogs});
}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeNavigateToBlogActionState extends HomeActionState {
  final GlobalBlogModel blogs;
  final bool isLiked;
  final PostLogin authValues;
  HomeNavigateToBlogActionState({required this.isLiked, required this.blogs, required this.authValues});
}

class HomeNavigateToSearchBlogsActionState extends HomeActionState {}

class HomeNavigateToNewBlogActionState extends HomeActionState {}

class HomeNavigateToProfileActionState extends HomeActionState {}