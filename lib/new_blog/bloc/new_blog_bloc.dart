import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/new_blog/new_blog_services.dart';

part 'new_blog_event.dart';
part 'new_blog_state.dart';

class NewBlogBloc extends Bloc<NewBlogEvent, NewBlogState> {
  NewBlogBloc() : super(NewBlogInitial()) {
    on<NewBlogInitialEvent>(newBlogInitialEvent);
    on<NewBlogPostButtonClickedEvent>(newBlogPostButtonClickedEvent);
    on<NewBlogHomeNavigateEvent>(newBlogHomeNavigateEvent);
    on<NewBlogSearchBlogsNavigateEvent>(newBlogSearchBlogsNavigateEvent);
  }

  FutureOr<void> newBlogInitialEvent(NewBlogInitialEvent event, Emitter<NewBlogState> emit) {
    emit(NewBlogInitialState());
  }

  FutureOr<void> newBlogPostButtonClickedEvent(NewBlogPostButtonClickedEvent event, Emitter<NewBlogState> emit) async {
    PostLogin authValues = event.authValues;
    String blogContent = event.blogContent;
    NewBlogServices newBlogServices = NewBlogServices();
    var responseValues = await newBlogServices.postNewBlog(authValues, blogContent);
    if(responseValues['status']=="Success"){
      emit(NewBlogPostedActionState());
    }
    else{
      emit(NewBlogPostedErrorActionState());
    }
  }

  FutureOr<void> newBlogHomeNavigateEvent(NewBlogHomeNavigateEvent event, Emitter<NewBlogState> emit) {
    PostLogin authValues = event.authValues;
    emit(NewBlogNavigateToHomeActionState(
      authValues: authValues
    ));
  }

  FutureOr<void> newBlogSearchBlogsNavigateEvent(NewBlogSearchBlogsNavigateEvent event, Emitter<NewBlogState> emit) {
    PostLogin authValues = event.authValues;
    emit(NewBlogNavigateToSearchBlogsActionState(authValues: authValues));
  }
}
