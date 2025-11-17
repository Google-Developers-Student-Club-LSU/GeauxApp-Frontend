
class OrganizationAdmin {
  final String organizationId;
  final String userId;

  OrganizationAdmin({
    required this.organizationId,
    required this.userId,
  });

  factory OrganizationAdmin.fromJson(Map<String, dynamic> json) {
    return OrganizationAdmin(
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

  OrganizationAdmin copyWith({
    String? organizationId,
    String? userId,
  }) {
    return OrganizationAdmin(
      organizationId: organizationId ?? this.organizationId,
      userId: userId ?? this.userId,
    );
  }
}
