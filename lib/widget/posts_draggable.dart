import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';

class PostsDraggable extends StatelessWidget {
  const PostsDraggable({
    super.key,
    required this.draggableScrollableController,
  });
  
 final  DraggableScrollableController draggableScrollableController;

  @override
  Widget build(BuildContext context) {
    
    return DraggableScrollableSheet(
      initialChildSize: 0.15, // 15% of screen height initially visible
      minChildSize: 0.1,      // can be dragged lower (10%)
      maxChildSize: 0.8,      // can expand up to 80%
      controller: draggableScrollableController,
      builder:  (BuildContext context, scrollController){
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: Colors.black),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(standardBorderRadius),
              topRight: Radius.circular(standardBorderRadius),
              ),
          ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            draggableBar,
            SliverAppBar(
              title: Text("Postss"),
              primary: true,
              pinned: true,
              centerTitle: false,
            )
          ],
        ),
        );

      },);
  }
}