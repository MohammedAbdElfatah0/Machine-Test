class  UserEntity {
  final String id;
  final String name;
  final String email;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['user']['_id'],
      name: json['user']['username'],
      email: json['user']['email'],
    );
  }
}