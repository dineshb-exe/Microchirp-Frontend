import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/routes.dart';
import 'package:microchirp_frontend/search_blogs/bloc/search_blogs_bloc.dart';
import 'package:microchirp_frontend/search_blogs/ui/utilities/search_app_bar.dart';
import 'package:microchirp_frontend/search_blogs/ui/utilities/search_results.dart';

@RoutePage(name: 'SearchBlogsPage')
class SearchBlogs extends StatefulWidget {
  final PostLogin authValues;
  const SearchBlogs({super.key, required this.authValues});
  @override
  State<SearchBlogs> createState() => _SearchBlogsState();
}

class _SearchBlogsState extends State<SearchBlogs> {
  int currentPageIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    searchBlogsBloc.add(SearchBlogsInitialEvent());
    super.initState();
  }
  SearchBlogsBloc searchBlogsBloc = SearchBlogsBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBlogsBloc, SearchBlogsState>(
      bloc: searchBlogsBloc,
      listener: (context, state) {
        // TODO: implement listener
        if(state is SearchNavigateToHomeActionState){
          context.router.popAndPush(
            HomePage(
              authValues: state.authValues,
            )
          );
        }
        else if(state is SearchBlogsErrorActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Error Occurred"
              ),
            ),
          );
        }
        else if(state is SearchNavigateToNewBlogActionState){
          context.router.popAndPush(
            NewBlogPage(
              authValues: state.authValues
            ),
          );
        }
      },
      listenWhen: (previous, current) => current is SearchBlogsActionState,
      buildWhen: (previous, current) => current is !SearchBlogsActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case SearchBlogsInitialState:
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.09),
                child: SearchAppBar(
                  searchBlogsBloc: searchBlogsBloc,
                  authValues: widget.authValues,
                  searchValue: "",
                ),
              ),
              body: Center(
                child: Text(
                  "Type a keyword to start exploring",
                  style: GoogleFonts.montserratAlternates(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              bottomNavigationBar: NavigationBar(
                  destinations: const <Widget>[
                    NavigationDestination(
                      selectedIcon: Icon(Icons.home),
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.edit),
                      label: 'New Blog',
                    ),
                    // NavigationDestination(
                    //   selectedIcon: Icon(Icons.person),
                    //   icon: Icon(Icons.person_outlined),
                    //   label: 'Profile',
                    // ),
                  ],
                  selectedIndex: currentPageIndex,
                  onDestinationSelected: (int index) {
                    if (index == 0 && currentPageIndex != 0) {
                      searchBlogsBloc.add(
                        SearchHomeNavigateEvent(
                          authValues: widget.authValues
                        )
                      );
                    }
                    else if (index == 2 && currentPageIndex != 2) {
                      searchBlogsBloc.add(
                        SearchNewBlogNavigateEvent(
                          authValues: widget.authValues
                        )
                      );
                    }
                    // else if(index==3&&widget.currentPageIndex!=3){
                    //
                    // }
                  }
              ),
            );
          case SearchBlogsLoadedSuccessState:
            return SearchResults(
              searchBlogsBloc: searchBlogsBloc,
              authValues: widget.authValues,
            );
          case SearchBlogsLoadingState():
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
