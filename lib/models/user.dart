// user.dart

enum UserRole { admin, member }

class User {
  final String id;
  final String username;
  final String displayName;
  final String email;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.displayName,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      role: _roleFromString(json['role']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "displayName": displayName,
      "email": email,
      "role": role.name, // enum → string
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }


  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? email,
    UserRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }


  static UserRole _roleFromString(String value) {
    switch (value) {
      case 'admin':
        return UserRole.admin;
      case 'member':
        return UserRole.member;
      default:
        throw Exception("Unknown role: $value");
    }
  }
}
