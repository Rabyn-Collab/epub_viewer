
import 'package:flutter/material.dart';
import 'package:flutter_fetch/models.dart';
import 'package:flutter_fetch/screens/book_screen.dart';
import 'package:flutter_fetch/screens/downloded_screen.dart';
import 'package:flutter_fetch/screens/local_view.dart';

class Views extends StatefulWidget {
  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {

  int _currentIndex = 0;
 final  List<Widget>  _items = [
   BookScreen(),
  ViewOn(),
 ViewsLand()

 ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: _items[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
       currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home' ),
          BottomNavigationBarItem(icon: Icon(Icons.storage),label: 'Storage' ),
          BottomNavigationBarItem(icon: Icon(Icons.vertical_align_bottom_outlined),label: 'Downloaded' )
        ],
      ),
    );
  }
}
