class User {
  String id;
  String name;
  String email;
  String dateOfBirth;
  String gender;
  String createdAt;
  String updatedAt;

  User({
    required this.name,
    required this.email,
    required this.gender,
    required this.id,
    required this.createdAt,
    required this.dateOfBirth,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      id: json['id'],
      createdAt: json['createdAt'],
      dateOfBirth: json['dateOfBirth'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
