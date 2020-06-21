import 'package:flutter/material.dart';
import 'Explore_page.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'card_widget.dart';
import 'card_detail.dart';
import 'map_search.dart';
//import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

void main() => runApp(Explore());

Card_detail c =Card_detail('hello','1234567890','098765432','loremimpusm','11',13);

class Explore extends StatelessWidget {
  int _index=0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light().copyWith(
        accentColor: Color(0xFF5cae67),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme:Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
//          fontFamily: ,
          fontSizeDelta: 10,)
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,)
        ),
      home: Scaffold(
    body: Explore_page(),
//    bottomNavigationBar: FloatingNavbar(
//    onTap: (int val) => setState(() => _index = val),
//    currentIndex: _index,
//    items: [
//    FloatingNavbarItem(icon: Icons.search,title:''),
//    FloatingNavbarItem(icon: Icons.map, title:''),
//    FloatingNavbarItem(icon: Icons.perm_identity,title:''),
//    ],
//    ),
 )
    );
//  return MaterialApp(home:Scaffold(
//    appBar: AppBar(
//          centerTitle: true,
//          title: Text('Explore'),
////        textTheme: ,
//        ),
//        body:
//        ListView.builder(
//          itemCount: 100,
//          itemBuilder: (BuildContext context, int index){
//            return card_widget(c);
//          },
//        )));
//          Column(
//            children: <Widget>[
//              Expanded(
//                child:card_widget(),
//              ) ,
//              Expanded(
//                child:card_widget(),
//              ) ,
//              Expanded(
//                child:card_widget(),
//              ),
//              Expanded(
//                child:card_widget(),
//              ),
//            ],
//          )
//        ),);
  }
}
