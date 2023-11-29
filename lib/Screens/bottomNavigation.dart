import 'package:flutter/material.dart';


import 'profile.dart';
import 'search.dart';
import 'category.dart';
import 'home.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _index = 0;
  void tap(index){
    setState(() {
      if(index >=0 && index < pages.length){
        _index = index;
      }
    });
  }

  final pages =[
    Home(),
    Search(),
    Category(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Color(0xff888888),
        selectedItemColor: Color(0xff9A03A8),
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search_rounded)
          ),
          BottomNavigationBarItem(
              label: "Category",
              icon:Icon(Icons.category_sharp)
          ),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)
          )
        ],

        currentIndex: _index,
        onTap: tap,

      ),
    );
  }
}
