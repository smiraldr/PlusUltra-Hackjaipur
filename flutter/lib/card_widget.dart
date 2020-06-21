import 'package:flutter/material.dart';

class card_widget extends StatelessWidget {
  card_widget({this.cardChild, this.onPress});
//  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Align(
            alignment: Alignment.centerRight,
            child: Stack(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 100,
                            maxWidth: 100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://picsum.photos/250?image=9'),
                          ),
                        )),
                  ))
            ])),
        margin: EdgeInsets.all(10),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10),
//          color: Colors.white,
//        ),
      ),
    );
  }
}
