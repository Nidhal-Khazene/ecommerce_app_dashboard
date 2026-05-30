class UserEntity {
  final String name;
  final String email;
  final String userId;
  bool isAdmin;

  UserEntity({
    required this.name,
    required this.email,
    required this.userId,
    this.isAdmin = false,
  });
}
