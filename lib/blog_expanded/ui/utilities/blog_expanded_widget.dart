import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/blog_expanded/bloc/blog_expanded_bloc.dart';
import 'package:microchirp_frontend/blog_expanded/comments_model.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/global_utilities/custom_app_bar.dart';
import 'package:microchirp_frontend/home/bloc/home_bloc.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/login/ui/utilities/general_field.dart';
import 'package:microchirp_frontend/new_blog/bloc/new_blog_bloc.dart';

import 'comment_tile.dart';

class BlogExpandedWidget extends StatefulWidget {
  final BlogExpandedBloc blogExpandedBloc;
  late final bool isLiked;
  final GlobalBlogModel blog;
  final PostLogin authValues;
  List<dynamic> comments;
  TextEditingController ctCont = TextEditingController();
  BlogExpandedWidget({super.key, required this.blogExpandedBloc, required this.isLiked, required this.blog, required this.authValues, required this.comments});

  @override
  State<BlogExpandedWidget> createState() => _BlogExpandedWidgetState();
}

class _BlogExpandedWidgetState extends State<BlogExpandedWidget> {
  String singleLike = "Like";
  String multipleLikes = "Likes";
  GlobalKey<FormState> commentTextKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery
            .of(context)
            .size
            .height * 0.09),
        child: CustomAppBar(
          automaticallyImplyLeading: true,
          title: "Blog",
          needLogoutButton: false,
          homeBloc: HomeBloc(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
                      child: Text(
                        widget.blog.display_title,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,15.0,0.0,10.0),
                      child: Text(
                        widget.blog.blog_content,
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            widget.isLiked = !widget.isLiked;
                            (widget.isLiked)?widget.blog.like_count++:widget.blog.like_count--;
                            setState(() {});
                            widget.blogExpandedBloc.add(
                                BlogExpandedLikeClickedEvent(
                                    authValues: widget.authValues,
                                    clickedBlog: widget.blog
                                )
                            );
                          },
                          icon: Icon(
                            (widget.isLiked)?Icons.favorite
                                :Icons.favorite_border,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          "${widget.blog.like_count} ${(widget.blog.like_count==1)?singleLike:multipleLikes}",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
            child: Text(
              "Comments",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height*0,
          // ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: ListView.builder(
                itemCount: widget.comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return CommentTile(
                    blogExpandedBloc: widget.blogExpandedBloc,
                    comment: CommentsModel.fromJSON(widget.comments[index]),
                    authValues: widget.authValues,
                  );
                },
              ),
            ),
          ),
          Form(
            key: commentTextKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3, //or null
                        maxLength: 100,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Comment"
                        ),
                        controller: widget.ctCont,
                        validator: (val){
                          if(val==null||val==""){
                            return "Please enter the value";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () {
                      if(commentTextKey.currentState!.validate()){
                        widget.blogExpandedBloc.add(BlogExpandedCommentPostingEvent(blog: widget.blog, comments: widget.comments, isLiked: widget.isLiked, comment: widget.ctCont.text, authValues: widget.authValues));
                      }
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: (widget.ctCont.text.isNotEmpty) ? Theme
                            .of(context)
                            .colorScheme
                            .primary : Theme
                            .of(context)
                            .colorScheme
                            .secondary
                    ),
                    child: Text(
                      "Post",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
