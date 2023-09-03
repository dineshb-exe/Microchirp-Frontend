import 'package:flutter/material.dart';

class GlobalNavigationBar extends StatefulWidget {
  final int currentPageIndex;
  const GlobalNavigationBar({super.key, required this.currentPageIndex});

  @override
  State<GlobalNavigationBar> createState() => _GlobalNavigationBarState();
}

class _GlobalNavigationBarState extends State<GlobalNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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
        if(index==0&&widget.currentPageIndex!=0){

        }
        else if(index==1&&widget.currentPageIndex!=1){

        }
        else if(index==2&&widget.currentPageIndex!=2){

        }
        // else if(index==3&&widget.currentPageIndex!=3){
        //
        // }
      },
    );
  }
}
