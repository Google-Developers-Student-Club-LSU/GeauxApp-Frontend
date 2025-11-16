// profile.dart

class Profile {
  final String id;
  final String userId;
  final String? avatar;   
  final String bio;
  final String major;
  final String affiliation;

  Profile({
    required this.id,
    required this.userId,
    this.avatar,
    required this.bio,
    required this.major,
    required this.affiliation,
  });


  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as String,
      userId: json['userId'] as String,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String? ?? "",
      major: json['major'] as String? ?? "Undecided",
      affiliation: json['affiliation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "avatar": avatar,
      "bio": bio,
      "major": major,
      "affiliation": affiliation,
    };
  }


  Profile copyWith({
    String? id,
    String? userId,
    String? avatar,
    String? bio,
    String? major,
    String? affiliation,
  }) {
    return Profile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      major: major ?? this.major,
      affiliation: affiliation ?? this.affiliation,
    );
  }
}
