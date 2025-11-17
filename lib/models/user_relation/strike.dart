class Strike {
  final String id;
  final String moderatorId;
  final String targetId;
  final String reason;
  final DateTime creationDate;
  final DateTime expirationDate;

  Strike({
    required this.id,
    required this.moderatorId,
    required this.targetId,
    required this.reason,
    required this.creationDate,
    required this.expirationDate,
  });

  factory Strike.fromJson(Map<String, dynamic> json) {
    return Strike(
      id: json['id'] as String,
      moderatorId: json['moderatorId'] as String,
      targetId: json['targetId'] as String,
      reason: json['reason'] as String? ?? "No reason provided.",
      creationDate: DateTime.parse(json['creationDate'] as String),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "moderatorId": moderatorId,
      "targetId": targetId,
      "reason": reason,
      "creationDate": creationDate.toIso8601String(),
      "expirationDate": expirationDate.toIso8601String(),
    };
  }

  Strike copyWith({
    String? id,
    String? moderatorId,
    String? targetId,
    String? reason,
    DateTime? creationDate,
    DateTime? expirationDate,
  }) {
    return Strike(
      id: id ?? this.id,
      moderatorId: moderatorId ?? this.moderatorId,
      targetId: targetId ?? this.targetId,
      reason: reason ?? this.reason,
      creationDate: creationDate ?? this.creationDate,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }
}
