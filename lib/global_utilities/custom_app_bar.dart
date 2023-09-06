import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microchirp_frontend/home/bloc/home_bloc.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final bool needLogoutButton;
  final HomeBloc homeBloc;
  const CustomAppBar({super.key, required this.title, required this.automaticallyImplyLeading, required this.needLogoutButton, required this.homeBloc});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.06,
            child: Image.asset(
              'assets/microchirp-transparent.png',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.04,
          ),
          Text(
            widget.title,
            style: GoogleFonts.montserratAlternates(
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      actions: [
        (widget.needLogoutButton)?IconButton(
          onPressed: (){
            widget.homeBloc.add(HomeLogoutEvent());
          },
          icon: Icon(
            Icons.logout_outlined
          )
        ):const SizedBox()
      ],
      iconTheme: IconThemeData(
        color: Colors.white54
      ),
    );
  }
}
