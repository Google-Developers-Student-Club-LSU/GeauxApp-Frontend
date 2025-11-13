class OrganizationPost {
  final String organizationId;
  final String postId;

  OrganizationPost({
    required this.organizationId,
    required this.postId,
  });

  factory OrganizationPost.fromJson(Map<String, dynamic> json) {
    return OrganizationPost(
      organizationId: json['organizationId'] as String,
      postId: json['postId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "organizationId": organizationId,
      "postId": postId,
    };
  }

  OrganizationPost copyWith({
    String? organizationId,
    String? postId,
  }) {
    return OrganizationPost(
      organizationId: organizationId ?? this.organizationId,
      postId: postId ?? this.postId,
    );
  }
}
