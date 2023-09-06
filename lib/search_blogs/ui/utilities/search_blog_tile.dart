import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/global_models/global_blog_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/search_blogs/bloc/search_blogs_bloc.dart';

class SearchBlogTile extends StatefulWidget {
  final SearchBlogsBloc searchBlogsBloc;
  final GlobalBlogModel blog;
  final PostLogin authValues;

  const SearchBlogTile({super.key, required this.searchBlogsBloc, required this.authValues, required this.blog});

  @override
  State<SearchBlogTile> createState() => _SearchBlogTileState();
}

class _SearchBlogTileState extends State<SearchBlogTile> {
  String singleLike = "Like";
  String multipleLikes = "Likes";
  late bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(60),
          onTap: (){},
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.86,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
                  child: Text(
                    widget.blog.display_title,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
                  child: Text(
                    widget.blog.blog_content,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        (isLiked)?Icons.favorite
                            :Icons.favorite_border,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "${widget.blog.like_count} ${(widget.blog.like_count==1)?singleLike:multipleLikes}",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
