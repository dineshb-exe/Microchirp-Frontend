import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/global_utilities/custom_app_bar.dart';
import 'package:microchirp_frontend/home/bloc/home_bloc.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/home/ui/utilities/blog_tile.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/routes.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key, required this.homeBloc2, required this.authValues});
  final HomeBloc homeBloc2;
  final int currentPageIndex = 0;
  final PostLogin authValues;

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: widget.homeBloc2,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is HomeNavigateToBlogActionState){
          context.router.push(
            BlogExpandedPage(
              isLiked: state.isLiked,
              blog: state.blogs,
              authValues: state.authValues
            ),
          );
        }
        else if(state is HomeNavigateToNewBlogActionState){
          context.router.popAndPush(
            NewBlogPage(authValues: state.authValues),
          );
        }
        else if(state is HomeNavigateToSearchBlogsActionState){
          context.router.push(SearchBlogsPage(authValues: state.authValues));
        }
        else if(state is HomeNavigateToLoginActionState){
          context.router.popUntilRoot();
          context.pushRoute(const LoginPage());
        }
      },
      builder: (context, state) {
        final successState = state as HomeLoadedSuccessState;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.09),
            child: CustomAppBar(
              automaticallyImplyLeading: false,
              title: "Home",
              needLogoutButton: true,
              homeBloc: widget.homeBloc2,
            )
          ),
          body: RefreshIndicator(
            onRefresh: () async{
              widget.homeBloc2.add(HomeInitialEvent(
                  authValues: widget.authValues
              ));
            },
            child: ListView.builder(
              itemCount: successState.blogs.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogTile(
                  homeBloc: widget.homeBloc2,
                  blog: GlobalBlogModel.fromJSON(successState.blogs[index]),
                  authValues: successState.authValues,
                );
              },
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
            selectedIndex: widget.currentPageIndex,
            onDestinationSelected: (int index){
              if(index==1&&widget.currentPageIndex!=1){
                widget.homeBloc2.add(HomeSearchBlogsNavigateEvent(authValues: widget.authValues));
              }
              else if(index==2&&widget.currentPageIndex!=2){
                widget.homeBloc2.add(HomeNewBlogNavigateEvent(authValues: widget.authValues));
              }
              // else if(index==3&&widget.currentPageIndex!=3){
              //
              // }
            },
          ),
        );
      },
    );
  }
}
