import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const standard_border_radius = 25.0;


TextStyle titleTextStyle = GoogleFonts.ptSans(
  textStyle: TextStyle(
    color: Colors.black,
    fontSize: 40,
  ),
);


const standardBorderRadius = 25.0;


const lsuPurple = Color(0xFF461D7C);


SliverToBoxAdapter draggableBar = SliverToBoxAdapter(
              child: Center(
                child: Center(
                  child: Container(
                    height: 4,
                    width: 100,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: lsuPurple,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            );
