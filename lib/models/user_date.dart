class UserDate {
  final String firstName;
  final String lastName;

  final String phone;
  final String? imagePath;
  const UserDate({
    required this.firstName,
    required this.lastName,

    required this.phone,
    this.imagePath,
  });
}
