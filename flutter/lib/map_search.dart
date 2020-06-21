import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_detail.dart';

class map_search extends StatefulWidget {
  @override
  map_searchState createState() => map_searchState();
}

class map_searchState extends State<map_search> {
  int _index=1;
  final List<Widget> _children =[];
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(
        builder: (BuildContext context){
          return IconButton(
            icon: Icon(Icons.arrow_back),
          );
        },
      ),
        centerTitle: true,
        title: Text('Hospitals Near Me'),
        actions: <Widget>[
          IconButton( icon: Icon(AntDesign.filter)),
        ],
      ),
      body: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            _zoomminusfunction(),
            _zoomplusfunction(),
            _buildContainer(),
          ],),
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.search,title:''),
          FloatingNavbarItem(icon: Icons.map, title:''),
          FloatingNavbarItem(icon: Icons.perm_identity,title:''),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xFF5cae67)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomplusfunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xFF5cae67)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: boxes(
                  "https://mk0ehealtheletsj3t14.kinstacdn.com/wp-content/uploads/2009/07/best-hospital-in-south-india.jpg",
                  40.738380, -73.988426,"Amnoral Hospital"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: boxes(
                  "https://mk0ehealtheletsj3t14.kinstacdn.com/wp-content/uploads/2009/07/best-hospital-in-south-india.jpg",
                  40.761421, -73.981667,"Amnoral Hospital"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: boxes(
                  "https://mk0ehealtheletsj3t14.kinstacdn.com/wp-content/uploads/2009/07/best-hospital-in-south-india.jpg",
                  40.732128, -73.999619,"Amnoral Hospital"),
            ),
          ],
        ),
      ),
    );
  }

  Widget boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0xFF5cae67),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xFF5cae67),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStarHalf,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
//        newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}
//
//Marker gramercyMarker = Marker(
//  markerId: MarkerId('gramercy'),
//  position: LatLng(40.738380, -73.988426),
//  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//
//Marker bernardinMarker = Marker(
//  markerId: MarkerId('bernardin'),
//  position: LatLng(40.761421, -73.981667),
//  infoWindow: InfoWindow(title: 'Le Bernardin'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//Marker blueMarker = Marker(
//  markerId: MarkerId('bluehill'),
//  position: LatLng(40.732128, -73.999619),
//  infoWindow: InfoWindow(title: 'Blue Hill'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//
////New York Marker
//
//Marker newyork1Marker = Marker(
//  markerId: MarkerId('newyork1'),
//  position: LatLng(40.742451, -74.005959),
//  infoWindow: InfoWindow(title: 'Los Tacos'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//Marker newyork2Marker = Marker(
//  markerId: MarkerId('newyork2'),
//  position: LatLng(40.729640, -73.983510),
//  infoWindow: InfoWindow(title: 'Tree Bistro'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//Marker newyork3Marker = Marker(
//  markerId: MarkerId('newyork3'),
//  position: LatLng(40.719109, -74.000183),
//  infoWindow: InfoWindow(title: 'Le Coucou'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(
//    BitmapDescriptor.hueViolet,
//  ),
//);
//}
