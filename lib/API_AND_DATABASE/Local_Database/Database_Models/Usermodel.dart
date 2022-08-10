class UserModel {
  final int id;
  final String name;
  final String email;
  final String image;
  final String sessionToken;

  const UserModel(
      {required this.image,
      required this.email,
      required this.id,
      required this.sessionToken,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      "sessionToken": sessionToken
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, image: $image , sessionToken: $sessionToken}';
  }
}
