
class OrganizationOfficer {
  final String organizationId;
  final String userId;

  OrganizationOfficer({
    required this.organizationId,
    required this.userId,
  });

  factory OrganizationOfficer.fromJson(Map<String, dynamic> json) {
    return OrganizationOfficer(
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

  OrganizationOfficer copyWith({
    String? organizationId,
    String? userId,
  }) {
    return OrganizationOfficer(
      organizationId: organizationId ?? this.organizationId,
      userId: userId ?? this.userId,
    );
  }
}
