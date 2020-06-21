import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Card_detail{
  String name,ph1,ph2,description,dist;
  int rating;

  Card_detail(String name,String ph1, String ph2,String description,String dist,int rating){
    this.name=name;
    this.ph1=ph1;
    this.ph2=ph2;
    this.description=description;
    this.dist=dist;
    this.rating=rating;
  }
}

List<Card_detail> c=[
Card_detail('hello','1234567890','098765432','loremimpusm','11',13),
Card_detail('hello','1234567890','098765432','loremimpusm','11',13),
Card_detail('hello','1234567890','098765432','loremimpusm','11',13),
];

//Widget myDetailsContainer1(String restaurantName) {
//  return Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    children: <Widget>[
//      Padding(
//        padding: const EdgeInsets.only(left: 8.0),
//        child: Container(
//            child: Text(restaurantName,
//              style: TextStyle(
//                  color: Color(0xFF5cae67),
//                  fontSize: 24.0,
//                  fontWeight: FontWeight.bold),
//            )),
//      ),
//      SizedBox(height:5.0),
//      Container(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Container(
//                  child: Text(
//                    "4.1",
//                    style: TextStyle(
//                      color: Colors.black54,
//                      fontSize: 18.0,
//                    ),
//                  )),
//              Container(
//                child: Icon(
//                  FontAwesomeIcons.solidStar,
//                  color: Colors.amber,
//                  size: 15.0,
//                ),
//              ),
//              Container(
//                child: Icon(
//                  FontAwesomeIcons.solidStar,
//                  color: Colors.amber,
//                  size: 15.0,
//                ),
//              ),
//              Container(
//                child: Icon(
//                  FontAwesomeIcons.solidStar,
//                  color: Colors.amber,
//                  size: 15.0,
//                ),
//              ),
//              Container(
//                child: Icon(
//                  FontAwesomeIcons.solidStar,
//                  color: Colors.amber,
//                  size: 15.0,
//                ),
//              ),
//              Container(
//                child: Icon(
//                  FontAwesomeIcons.solidStarHalf,
//                  color: Colors.amber,
//                  size: 15.0,
//                ),
//              ),
//              Container(
//                  child: Text(
//                    "(946)",
//                    style: TextStyle(
//                      color: Colors.black54,
//                      fontSize: 18.0,
//                    ),
//                  )),
//            ],
//          )),
//      SizedBox(height:5.0),
//      Container(
//          child: Text(
//            "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
//            style: TextStyle(
//              color: Colors.black54,
//              fontSize: 18.0,
//            ),
//          )),
//      SizedBox(height:5.0),
//      Container(
//          child: Text(
//            "Closed \u00B7 Opens 17:00 Thu",
//            style: TextStyle(
//                color: Colors.black54,
//                fontSize: 18.0,
//                fontWeight: FontWeight.bold),
//          )),
//    ],
//  );
//}