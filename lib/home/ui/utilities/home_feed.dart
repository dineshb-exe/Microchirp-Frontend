import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/global_utilities/custom_app_bar.dart';
import 'package:microchirp_frontend/global_utilities/global_navigation_bar.dart';
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
      },
      builder: (context, state) {
        final successState = state as HomeLoadedSuccessState;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.09),
            child: const CustomAppBar(
              automaticallyImplyLeading: false,
              title: "Home",
            )
          ),
          body: ListView.builder(
            itemCount: successState.blogs.length,
            itemBuilder: (BuildContext context, int index) {
              return BlogTile(
                homeBloc: widget.homeBloc2,
                blog: GlobalBlogModel.fromJSON(successState.blogs[index]),
                authValues: successState.authValues,
              );
            },
          ),
          bottomNavigationBar: GlobalNavigationBar(
            currentPageIndex: widget.currentPageIndex,
          ),
        );
      },
    );
  }
}
