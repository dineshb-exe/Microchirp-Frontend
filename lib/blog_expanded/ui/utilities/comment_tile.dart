import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/blog_expanded/bloc/blog_expanded_bloc.dart';
import 'package:microchirp_frontend/blog_expanded/comments_model.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.blogExpandedBloc, required this.comment, required this.authValues});
  final BlogExpandedBloc blogExpandedBloc;
  final CommentsModel comment;
  final PostLogin authValues;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.86,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0.0),
              child: Text(
                comment.display_title,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
              child: Text(
                comment.comment_content,
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
