

class XYPoint {
  final double x;
  final double y;

  XYPoint({required this.x, required this.y});

  factory XYPoint.fromJson(dynamic json) {
    if (json is List && json.length == 2) {
      return XYPoint(
        x: (json[0] as num).toDouble(),
        y: (json[1] as num).toDouble(),
      );
    }
    throw Exception("Invalid point format. Expected [x, y]");
  }

  List<double> toJson() => [x, y];
}

class Post {
  final String id;
  final String authorId;
  final String title;
  final String description;
  final XYPoint location;
  final int likes;
  final int dislikes;
  final int shares;
  final int color;
  final DateTime startDate;
  final DateTime expirationDate;

  Post({
    required this.id,
    required this.authorId,
    required this.title,
    required this.description,
    required this.location,
    required this.likes,
    required this.dislikes,
    required this.shares,
    required this.color,
    required this.startDate,
    required this.expirationDate,
  });


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      authorId: json['authorId'],
      title: json['title'],
      description: json['description'],
      location: XYPoint.fromJson(json['location']),
      likes: json['likes'] ?? 0,
      dislikes: json['dislikes'] ?? 0,
      shares: json['shares'] ?? 0,
      color: json['color'],
      startDate: DateTime.parse(json['startDate']),
      expirationDate: DateTime.parse(json['expirationDate']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "authorId": authorId,
      "title": title,
      "description": description,
      "location": location.toJson(),
      "likes": likes,
      "dislikes": dislikes,
      "shares": shares,
      "color": color,
      "startDate": startDate.toIso8601String(),
      "expirationDate": expirationDate.toIso8601String(),
    };
  }

  // -------------------------
  // copyWith
  // -------------------------
  Post copyWith({
    String? id,
    String? authorId,
    String? title,
    String? description,
    XYPoint? location,
    int? likes,
    int? dislikes,
    int? shares,
    int? color,
    DateTime? startDate,
    DateTime? expirationDate,
  }) {
    return Post(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      shares: shares ?? this.shares,
      color: color ?? this.color,
      startDate: startDate ?? this.startDate,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }
}
