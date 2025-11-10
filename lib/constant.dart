import 'dart:ui';

import 'package:flutter/material.dart';


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