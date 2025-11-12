import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';
import 'package:geaux_app_frontend/widget/custom_button.dart';

class PostsDraggable extends StatefulWidget {
  const PostsDraggable({
    super.key,
    required this.draggableScrollableController,
  });

  final DraggableScrollableController draggableScrollableController;

  @override
  State<PostsDraggable> createState() => _PostsDraggableState();
}

class _PostsDraggableState extends State<PostsDraggable> {
  double _fontSize = 40;
  double _dynamicPadding = 5;

  @override
  void initState() {
    super.initState();
    // Listen for scroll updates
    widget.draggableScrollableController.addListener(_updateFontSize);
    widget.draggableScrollableController.addListener(_updatePadding);

  }

  void _updatePadding(){
    final extent = widget.draggableScrollableController.size;
    const minExtent = 0.1;
    const maxExtent = 0.95;
    const minPadding = 5.0;
    const maxPadding = 15.0;
     final normalized =
        ((extent - minExtent) / (maxExtent - minExtent)).clamp(0, 1);
    final changePadding = minPadding + (maxPadding - minPadding) * normalized;

    setState(() => _dynamicPadding = changePadding);
  }

  void _updateFontSize() {
    final extent = widget.draggableScrollableController.size;

    const minExtent = 0.1;
    const maxExtent = 0.95;
    const minFont = 40.0;
    const maxFont = 80.0;

    final normalized =
        ((extent - minExtent) / (maxExtent - minExtent)).clamp(0, 1);
    final newFontSize = minFont + (maxFont - minFont) * normalized;

    setState(() => _fontSize = newFontSize);
  }

  void newPostButton(){
    print("Hello");
  }

  @override
  void dispose() {
    widget.draggableScrollableController.removeListener(_updateFontSize);
    widget.draggableScrollableController.removeListener(_updatePadding);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.1,
      maxChildSize: .92,
      controller: widget.draggableScrollableController,
      builder: (context, scrollController) {
        return Container(
          
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: dragglePostBackground,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(standardBorderRadius),
              topRight: Radius.circular(standardBorderRadius),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              draggableBar,
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Posts",
                  style: TextStyle(fontSize: _fontSize, color: Colors.white),
                ),
                primary: false,
                pinned: false,
                centerTitle: false,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:_dynamicPadding,
                    horizontal: 20
                  ),
                  child: CustomButton(onPressed: newPostButton, child: Text("New Post")),
                ))
            ],
          ),
        );
      },
    );
  }
}
