import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/global_utilities/custom_app_bar.dart';
import 'package:microchirp_frontend/home/bloc/home_bloc.dart';
import 'package:microchirp_frontend/login/post_login_model.dart';
import 'package:microchirp_frontend/new_blog/bloc/new_blog_bloc.dart';

class NewBlogWidget extends StatefulWidget {
  final NewBlogBloc newBlogBloc;
  final PostLogin authValues;
  final TextEditingController newBlogCont;
  const NewBlogWidget({super.key, required this.newBlogBloc, required this.authValues, required this.newBlogCont});

  @override
  State<NewBlogWidget> createState() => _NewBlogWidgetState();
}

class _NewBlogWidgetState extends State<NewBlogWidget> {
  bool draftFlag = false;
  int currentPageIndex = 2;
  final GlobalKey<FormState> blogTextKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery
            .of(context)
            .size
            .height * 0.09),
        child: CustomAppBar(
            title: "New Blog",
            automaticallyImplyLeading: false,
          needLogoutButton: false,
          homeBloc: HomeBloc(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: blogTextKey,
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
                      maxLines: 10, //or null
                      maxLength: 500,
                      decoration: const InputDecoration.collapsed(
                        hintText: "What's up?"
                      ),
                      controller: widget.newBlogCont,
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
                    if(blogTextKey.currentState!.validate()){
                      widget.newBlogBloc.add(NewBlogPostButtonClickedEvent(authValues: widget.authValues, blogContent: widget.newBlogCont.text));
                    }
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: (widget.newBlogCont.text.isNotEmpty) ? Theme
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
              widget.newBlogBloc.add(NewBlogHomeNavigateEvent(
                  authValues: widget.authValues
              ));
            }
            else if (index == 1 && currentPageIndex != 1) {
              widget.newBlogBloc.add(
                NewBlogSearchBlogsNavigateEvent(
                  authValues: widget.authValues
                )
              );
            }
            else if (index == 2 && currentPageIndex != 2) {

            }
            // else if(index==3&&widget.currentPageIndex!=3){
            //
            // }
          }
      ),
    );
  }
}