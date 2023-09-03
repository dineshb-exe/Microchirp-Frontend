import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/home/bloc/home_bloc.dart';
import 'package:microchirp_frontend/home/ui/utilities/home_feed.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/routes.dart';

@RoutePage(name: 'HomePage')
class Home extends StatefulWidget {
  final PostLogin authValues;
  const Home({super.key, required this.authValues});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    _homeBloc.add(HomeInitialEvent(
      authValues: widget.authValues
    ));
    super.initState();
  }
  HomeBloc _homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            return HomeFeed(
              homeBloc2: _homeBloc,
              authValues: widget.authValues,
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                  "Error"
                ),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
