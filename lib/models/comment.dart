// comment.dart

class Comment {
  final String id;
  final String authorId;
  final String? postId;   
  final String? profileId; 
  final String message;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comment({
    required this.id,
    required this.authorId,
    this.postId,
    this.profileId,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  // -------------------------
  // JSON Deserialization
  // -------------------------
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      postId: json['postId'] as String?,
      profileId: json['profileId'] as String?,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  // -------------------------
  // JSON Serialization
  // -------------------------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "authorId": authorId,
      "postId": postId,
      "profileId": profileId,
      "message": message,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }

  // -------------------------
  // copyWith
  // -------------------------
  Comment copyWith({
    String? id,
    String? authorId,
    String? postId,
    String? profileId,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Comment(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      postId: postId ?? this.postId,
      profileId: profileId ?? this.profileId,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
