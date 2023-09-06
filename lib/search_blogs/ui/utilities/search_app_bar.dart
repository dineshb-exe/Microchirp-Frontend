import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/search_blogs/bloc/search_blogs_bloc.dart';

class SearchAppBar extends StatefulWidget {
  final SearchBlogsBloc searchBlogsBloc;
  final PostLogin authValues;
  late String searchValue;
  SearchAppBar({super.key, required this.searchBlogsBloc, required this.authValues, required this.searchValue});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return EasySearchBar(
      title: Text(
        "Explore",
        style: GoogleFonts.montserratAlternates(
          fontWeight: FontWeight.bold,
          color: Colors.white54,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white54,
      ),
      onSearch: (String val) {
        widget.searchValue = val;
        widget.searchBlogsBloc.add(SearchBlogsSearchClickedEvent(authValues: widget.authValues, subStringValue: widget.searchValue));
      },
    );
  }
}
