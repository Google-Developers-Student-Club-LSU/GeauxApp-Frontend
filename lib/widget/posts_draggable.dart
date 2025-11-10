import 'package:flutter/material.dart';

class PostsDraggable extends StatelessWidget {
  const PostsDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder:  (BuildContext context, scrollController){
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: 
          ),
        );

      },);
  }
}