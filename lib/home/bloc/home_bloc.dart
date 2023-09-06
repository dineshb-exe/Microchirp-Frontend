import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/global_services/preferences.dart';
import 'package:microchirp_frontend/home/home_services.dart';
import 'package:microchirp_frontend/home/ui/home.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeBlogNavigateEvent>(homeBlogNavigateEvent);
    on<HomeBlogLikeClickedEvent>(homeBlogLikeClickedEvent);
    on<HomeSearchBlogsNavigateEvent>(homeSearchBlogsNavigateEvent);
    on<HomeNewBlogNavigateEvent>(homeNewBlogNavigateEvent);
    on<HomeProfileNavigateEvent>(homeProfileNavigateEvent);
    on<HomeLogoutEvent>(homeLogoutEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    PostLogin authValues = event.authValues;
    HomeServices h1 = HomeServices();
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    var responseValues = await h1.feedBlogs(authValues);
    if(responseValues['status'] =="Failure"){
      emit(HomeErrorState());
    }
    else if(responseValues['status']=="Success"){
      print("Response recieved");
      emit(HomeLoadedSuccessState(authValues: authValues, blogs: responseValues['data']));
    }
  }

  FutureOr<void> homeBlogNavigateEvent(HomeBlogNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToBlogActionState(
      isLiked: event.isLiked,
      blogs: event.blogs,
      authValues: event.authValues
    ));
  }

  FutureOr<void> homeBlogLikeClickedEvent(HomeBlogLikeClickedEvent event, Emitter<HomeState> emit) async{
    GlobalBlogModel likedBlog = event.clickedBlog;
    PostLogin authValues = event.authValues;
    HomeServices s1 = HomeServices();
    var responseValues = await s1.recordLike(authValues, likedBlog);
  }

  FutureOr<void> homeSearchBlogsNavigateEvent(HomeSearchBlogsNavigateEvent event, Emitter<HomeState> emit) {
    PostLogin authValues = event.authValues;
    emit(HomeNavigateToSearchBlogsActionState(authValues: authValues));
  }

  FutureOr<void> homeNewBlogNavigateEvent(HomeNewBlogNavigateEvent event, Emitter<HomeState> emit) {
    PostLogin authValues = event.authValues;
    emit(HomeNavigateToNewBlogActionState(
      authValues: authValues
    ));
  }

  FutureOr<void> homeProfileNavigateEvent(HomeProfileNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToProfileActionState());
  }

  FutureOr<void> homeLogoutEvent(HomeLogoutEvent event, Emitter<HomeState> emit) async {
    await saveJwtToSharedPreferences("");
    await saveUserIDToSharedPreferences("");
    emit(HomeNavigateToLoginActionState());
  }
}
