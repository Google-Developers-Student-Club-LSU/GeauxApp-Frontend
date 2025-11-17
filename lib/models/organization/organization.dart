
class Organization {
  final String id;
  final String name;
  final DateTime creationDate;
  final String? banner; 
  final String bio;

  Organization({
    required this.id,
    required this.name,
    required this.creationDate,
    this.banner,
    required this.bio,
  });

  // JSON Deserialization
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      banner: json['banner'] as String?, 
      bio: json['bio'] as String? ??
          "This organization has no bio yet.", 
    );
  }

  // JSON Serialization
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "creationDate": creationDate.toIso8601String(),
      "banner": banner,
      "bio": bio,
    };
  }

  // copyWith
  Organization copyWith({
    String? id,
    String? name,
    DateTime? creationDate,
    String? banner,
    String? bio,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      creationDate: creationDate ?? this.creationDate,
      banner: banner ?? this.banner,
      bio: bio ?? this.bio,
    );
  }
}
