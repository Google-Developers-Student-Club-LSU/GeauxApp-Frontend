import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';

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

  @override
  void initState() {
    super.initState();
    // Listen for scroll updates
    widget.draggableScrollableController.addListener(_updateFontSize);
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

  @override
  void dispose() {
    widget.draggableScrollableController.removeListener(_updateFontSize);
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
            color: Colors.black.withValues(alpha: 0.5),
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
            ],
          ),
        );
      },
    );
  }
}
