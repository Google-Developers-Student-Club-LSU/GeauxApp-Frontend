import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/widget/map.dart';
import 'package:geaux_app_frontend/widget/posts_draggable.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  
  final DraggableScrollableController sheetController = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(),
          PostsDraggable(
            draggableScrollableController: DraggableScrollableController(),
          )
        ],
      ) ,
    );
  }
}

