import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/blog_expanded/bloc/blog_expanded_bloc.dart';
import 'package:microchirp_frontend/blog_expanded/ui/utilities/blog_expanded_widget.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/global_utilities/custom_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

@RoutePage(name: 'BlogExpandedPage')
class BlogExpanded extends StatefulWidget {
  final bool isLiked;
  final GlobalBlogModel blog;
  final PostLogin authValues;
  BlogExpanded({super.key, required this.isLiked, required this.blog, required this.authValues});

  @override
  State<BlogExpanded> createState() => _BlogExpandedState();
}

class _BlogExpandedState extends State<BlogExpanded> {
  BlogExpandedBloc blogExpandedBloc = BlogExpandedBloc();
  @override
  void initState() {
    // TODO: implement initState
    blogExpandedBloc.add(BlogExpandedInitialEvent(
      isLiked: widget.isLiked,
      blog: widget.blog,
      authValues: widget.authValues
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogExpandedBloc, BlogExpandedState>(
      bloc: blogExpandedBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case BlogLoadedSuccessState:
            final successState = state as BlogLoadedSuccessState;
            return BlogExpandedWidget(
              blogExpandedBloc: blogExpandedBloc,
              isLiked: widget.isLiked,
              blog: widget.blog,
              authValues: widget.authValues,
              comments: successState.comments,
            );
          case BlogErrorState:
            return Scaffold(
              body: Center(
                child: Text(
                  "Error",
                  style: GoogleFonts.montserratAlternates(),
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
