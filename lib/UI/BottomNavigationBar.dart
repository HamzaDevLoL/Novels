import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:novels/UI/Favorite.dart';
import 'package:novels/UI/HomePage.dart';
import 'package:novels/UI/Library.dart';



class BottomNavigationBarClass extends StatefulWidget {
  const BottomNavigationBarClass({ Key? key }) : super(key: key);

  @override
  State<BottomNavigationBarClass> createState() => _BottomNavigationBarClassState();
}

class _BottomNavigationBarClassState extends State<BottomNavigationBarClass> {

  int _currentIndex = 0;
  void onTabTapped(int index) {  
    setState(() {  
      _currentIndex = index;  
    });  
  }  


  var list = [HomePage(),Favorite(),Library()];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
          
            icon: Icon(Icons.home_outlined,color: Colors.black45,size: 35,),
            label: "",
            activeIcon: Icon(Icons.home,color: Colors.red,size: 35,),
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.favorite_border,color: Colors.black45,size: 35),
            label: "",
            activeIcon: Icon(Icons.favorite,color: Colors.red,size: 35,),
          ),
          BottomNavigationBarItem(
            
              icon: Icon(Icons.book_rounded,color: Colors.black45,size: 35),
              label: "",
              activeIcon: Icon(Icons.book_rounded,color: Colors.red,size: 35,),
          ),
          
        ]),
    );
  }
}