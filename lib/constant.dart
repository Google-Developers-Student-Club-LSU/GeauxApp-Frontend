import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


const standardBorderRadius = 25.0;
const lsuColor = Color(0xFF461D7C);



SliverToBoxAdapter draggableBar = SliverToBoxAdapter(
  child: Center(
    child: Container(
      height: 4,
      width: 100,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: lsuColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  ),
);



// TextStyle titleTextStyle = GoogleFonts.lato(
//   textStyle: TextStyle(
//     color: Colors.black,
//     fontSize: 40,
//   ),
// );


const lsuCampus = [
  LatLng(30.4177217, -91.1837863),
  LatLng(30.4178975, -91.1875521),
  LatLng(30.4183103, -91.1940762),
  LatLng(30.4154421, -91.1944946),
  LatLng(30.4136101, -91.1953529),
  LatLng(30.406726, -91.198872),
  LatLng(30.4051715, -91.1994299),
  LatLng(30.4037465, -91.1885079),
  LatLng(30.3991769, -91.1890864),
  LatLng(30.3986957, -91.1804175),
  LatLng(30.4043219, -91.1840224),
  LatLng(30.4042849, -91.1821985),
  LatLng(30.4040258, -91.1817479),
  LatLng(30.4042062, -91.1814689),
  LatLng(30.4032106, -91.1749675),
  LatLng(30.4066714, -91.1713626),
  LatLng(30.4074856, -91.1702898),
  LatLng(30.4076707, -91.1690023),
  LatLng(30.4089291, -91.1701825),
  LatLng(30.4092437, -91.1663201),
  LatLng(30.4129633, -91.1673715),
  LatLng(30.4140551, -91.1686161),
  LatLng(30.4156095, -91.1687984),
  LatLng(30.4164329, -91.1691847),
  LatLng(30.4167475, -91.170043),
  LatLng(30.4176912, -91.1701825),
  LatLng(30.4186627, -91.1708691),
  LatLng(30.4195231, -91.1714055),
  LatLng(30.4184406, -91.17574),
  LatLng(30.4157575, -91.1757078),
  LatLng(30.4157853, -91.1763194),
  LatLng(30.4171435, -91.1757602),
  LatLng(30.4173656, -91.1789574),
  LatLng(30.4183463, -91.1790004),
  LatLng(30.4198081, -91.1791506),
  LatLng(30.4196786, -91.1841931),
  LatLng(30.4177172, -91.1840644),
];
