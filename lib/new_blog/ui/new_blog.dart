import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/new_blog/bloc/new_blog_bloc.dart';
import 'package:microchirp_frontend/new_blog/ui/utilities/new_blog_widget.dart';
import 'package:microchirp_frontend/routes.dart';

@RoutePage(name: 'NewBlogPage')
class NewBlog extends StatefulWidget {
  final PostLogin authValues;
  const NewBlog({super.key, required this.authValues});

  @override
  State<NewBlog> createState() => _NewBlogState();
}

class _NewBlogState extends State<NewBlog> {
  NewBlogBloc newBlogBloc = NewBlogBloc();
  TextEditingController newBlogCont = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    newBlogBloc.add(NewBlogInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewBlogBloc, NewBlogState>(
      bloc: newBlogBloc,
      listener: (context, state) {
        // TODO: implement listener
        if(state is NewBlogPostedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Blog Posted"
              ),
            ),
          );
          newBlogCont.text = "";
        }
        else if(state is NewBlogPostedErrorActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "Error occurred"
              ),
            ),
          );
          newBlogCont.text = "";
        }
        else if(state is NewBlogNavigateToHomeActionState){
          context.router.popAndPush(
            HomePage(authValues: state.authValues),
          );
        }
      },
      listenWhen: (previous, current) => current is NewBlogActionState,
      buildWhen: (previous, current) => current is !NewBlogActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case NewBlogInitialState:
            return NewBlogWidget(
              authValues: widget.authValues,
              newBlogBloc: newBlogBloc,
              newBlogCont: newBlogCont,
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}

