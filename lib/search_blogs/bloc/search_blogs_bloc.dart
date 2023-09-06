import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/search_blogs/search_blogs_services.dart';

part 'search_blogs_event.dart';
part 'search_blogs_state.dart';

class SearchBlogsBloc extends Bloc<SearchBlogsEvent, SearchBlogsState> {
  SearchBlogsBloc() : super(SearchBlogsInitial()) {
    on<SearchBlogsInitialEvent>(searchBlogsInitialEvent);
    on<SearchBlogsSearchClickedEvent>(searchBlogsSearchClickedEvent);
    on<SearchHomeNavigateEvent>(searchHomeNavigateEvent);
    on<SearchNewBlogNavigateEvent>(searchNewBlogNavigateEvent);
  }

  FutureOr<void> searchBlogsInitialEvent(SearchBlogsInitialEvent event, Emitter<SearchBlogsState> emit) {
    emit(SearchBlogsInitialState());
  }

  FutureOr<void> searchBlogsSearchClickedEvent(SearchBlogsSearchClickedEvent event, Emitter<SearchBlogsState> emit) async {
    PostLogin authValues = event.authValues;
    String subStringValue = event.subStringValue;
    SearchBlogsServices searchBlogsServices = SearchBlogsServices();
    var response = await searchBlogsServices.searchBlogsFeed(authValues, subStringValue);
    if(response['status']=="Success"){
      emit(
        SearchBlogsLoadedSuccessState(
          authValues: authValues,
          blogs: response['data']
        )
      );
    }
    else if(response['status']=="Failure"){
      emit(SearchBlogsErrorActionState());
    }

  }

  FutureOr<void> searchHomeNavigateEvent(SearchHomeNavigateEvent event, Emitter<SearchBlogsState> emit) {
    PostLogin authValues = event.authValues;
    emit(SearchNavigateToHomeActionState(authValues: authValues));
  }

  FutureOr<void> searchNewBlogNavigateEvent(SearchNewBlogNavigateEvent event, Emitter<SearchBlogsState> emit) {
    PostLogin authValues = event.authValues;
    emit(SearchNavigateToNewBlogActionState(authValues: authValues));
  }
}
