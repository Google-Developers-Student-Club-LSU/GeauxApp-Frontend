class Follow {
  final String id;
  final String userId;
  final String targetId;
  final DateTime createdAt;

  Follow({
    required this.id,
    required this.userId,
    required this.targetId,
    required this.createdAt,
  });

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      id: json['id'] as String,
      userId: json['userId'] as String,
      targetId: json['targetId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "targetId": targetId,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  Follow copyWith({
    String? id,
    String? userId,
    String? targetId,
    DateTime? createdAt,
  }) {
    return Follow(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      targetId: targetId ?? this.targetId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
