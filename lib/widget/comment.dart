import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  //local states
  final int commentID;
  final Image? userAvatar;
  final String userName;
  final String date;
  final String message;
  final int likeCount;
  final bool hasLiked;
  //functions
  const CommentWidget({
    super.key,
    required this.commentID,
    this.userAvatar,
    this.userName = "",
    this.date = "",
    this.message = "Unable to Load Comment",
    this.likeCount = -999,
    this.hasLiked = false,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  void initState() {
    super.initState();

    // This code runs only once when the widget is first created
    //check if provider has loaded data for comment id
    //if not call load_comment in services
  }

  void onUserTap() {
    print("tapped user");
    // go to user page
  }

  void onLikeToggle() {
    print("tapped like");
    //call service func to update comment api
    //set has liked dto be true or false and refresh like count
    setState(() {
      // update state here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Row(
        children: [
          // Avatar (Clickable)
          GestureDetector(
            onTap: onUserTap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              child: widget.userAvatar == null
                  ? const Icon(Icons.person, color: Colors.grey)
                  : widget.userAvatar,
            ),
          ),

          const SizedBox(width: 10),

          // Comment Body
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username + Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Comment Text
                Text(widget.message, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Like Button + Count
          Column(
            children: [
              IconButton(
                icon: Icon(
                  widget.hasLiked ? Icons.favorite : Icons.favorite_border,
                  color: widget.hasLiked ? Colors.red : Colors.grey.shade700,
                ),
                onPressed: onLikeToggle,
              ),
              Text('${widget.likeCount}', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
