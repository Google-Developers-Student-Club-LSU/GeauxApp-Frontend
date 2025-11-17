import 'package:flutter/material.dart';

// Data class to represent a comment
class CommentData {
  final int commentID;
  final Image? userAvatar;
  final String userName;
  final String date;
  final String message;
  final int likeCount;
  final bool hasLiked;

  const CommentData({
    required this.commentID,
    this.userAvatar,
    this.userName = "",
    this.date = "",
    this.message = "Unable to Load Comment",
    this.likeCount = 0,
    this.hasLiked = false,
  });
}

// Scrollable comment section widget
//view an example on how to load it at end of file
class CommentSection extends StatelessWidget {
  final List<CommentData> comments;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;

  const CommentSection({
    super.key,
    required this.comments,
    this.padding,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No comments yet',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      physics: physics ?? const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentWidget(
          commentID: comment.commentID,
          userAvatar: comment.userAvatar,
          userName: comment.userName,
          date: comment.date,
          message: comment.message,
          likeCount: comment.likeCount,
          hasLiked: comment.hasLiked,
        );
      },
    );
  }
}

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
    // todo: if you are planning to only provide a comment id as a prop, make an api call and load into state
     }

  void onUserTap() {
    print("tapped user");
    // todo: have it go to user page
  }

  void onLikeToggle() {
    print("tapped like");
    //todo: call service func to update comment api
    //todo: set has liked dto be true or false and refresh like count
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
              child: widget.userAvatar ?? const Icon(Icons.person, color: Colors.grey),
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
/*

CommentSection(
                comments: [
                  CommentData(
                    commentID: 1,
                    userName: "Alice Johnson",
                    date: "12-5-2024",
                    message: "This is amazing! Great work!",
                    likeCount: 24,
                    hasLiked: true,
                  ),
                  CommentData(
                    commentID: 2,
                    userName: "Bob Smith",
                    date: "12-4-2024",
                    message: "Love this post! Keep it up!",
                    likeCount: 15,
                    hasLiked: false,
                  ),
                  CommentData(
                    commentID: 3,
                    userName: "Charlie Brown",
                    date: "12-3-2024",
                    message: "Really helpful content, thanks for sharing!",
                    likeCount: 42,
                    hasLiked: true,
                  ),
                  CommentData(
                    commentID: 4,
                    userName: "Diana Prince",
                    date: "12-2-2024",
                    message: "Can't wait to see more!",
                    likeCount: 8,
                    hasLiked: false,
                  ),
                  CommentData(
                    commentID: 5,
                    userName: "Eve Wilson",
                    date: "12-1-2024",
                    message: "This is exactly what I needed!",
                    likeCount: 33,
                    hasLiked: true,
                  ),
                  CommentData(
                    commentID: 6,
                    userName: "Frank Miller",
                    date: "11-30-2024",
                    message: "Awesome!",
                    likeCount: 19,
                    hasLiked: false,
                  ),
                ],
              ),
  */
