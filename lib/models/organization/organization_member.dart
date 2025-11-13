
class OrganizationMember {
  final String organizationId;
  final String userId;

  OrganizationMember({
    required this.organizationId,
    required this.userId,
  });

  factory OrganizationMember.fromJson(Map<String, dynamic> json) {
    return OrganizationMember(
      organizationId: json['organizationId'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "organizationId": organizationId,
      "userId": userId,
    };
  }

  OrganizationMember copyWith({
    String? organizationId,
    String? userId,
  }) {
    return OrganizationMember(
      organizationId: organizationId ?? this.organizationId,
      userId: userId ?? this.userId,
    );
  }
}
