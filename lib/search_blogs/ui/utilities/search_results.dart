import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/search_blogs/bloc/search_blogs_bloc.dart';
import 'package:microchirp_frontend/search_blogs/ui/utilities/search_app_bar.dart';
import 'package:microchirp_frontend/search_blogs/ui/utilities/search_blog_tile.dart';

class SearchResults extends StatefulWidget {
  final SearchBlogsBloc searchBlogsBloc;
  final PostLogin authValues;
  const SearchResults({super.key, required this.searchBlogsBloc, required this.authValues});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  String searchValue = "";
  TextEditingController searchValCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBlogsBloc, SearchBlogsState>(
      bloc: widget.searchBlogsBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var successState = state as SearchBlogsLoadedSuccessState;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.09),
            child: SearchAppBar(
              searchBlogsBloc: widget.searchBlogsBloc,
              authValues: widget.authValues,
              searchValue: searchValue,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: successState.blogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SearchBlogTile(
                      searchBlogsBloc: widget.searchBlogsBloc,
                      blog: GlobalBlogModel.fromJSON(successState.blogs[index]),
                      authValues: successState.authValues,
                    );
                  },
                ),
              ),
            ],
          )
        );
      },
    );
  }
}
