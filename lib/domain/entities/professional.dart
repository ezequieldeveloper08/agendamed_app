import 'package:mediup/domain/entities/address.dart';
import 'package:mediup/domain/entities/opening_hour.dart';
import 'package:mediup/domain/entities/professional_category.dart';
import 'package:mediup/domain/entities/user.dart';

class Professional {
  String id;
  String name;
  String description;
  User user;
  List<OpeningHour> openingHours;
  Address address;
  List<ProfessionalCategory> categories;
  String? avatar;
  String? cellphone;
  String? document;

  Professional({
    required this.address,
    required this.description,
    required this.id,
    required this.name,
    required this.openingHours,
    required this.user,
    required this.categories,
    this.avatar,
    this.cellphone,
    this.document,
  });

  factory Professional.fromJson(Map<String, dynamic> json) {
    return Professional(
      address: Address.fromJson(json['address']),
      description: json['description'],
      id: json['id'],
      name: json['name'],
      openingHours: (json['openingHours'] as List)
          .map((item) => OpeningHour.fromJson(item))
          .toList(),
      user: User.fromJson(json['user']),
      categories: (json['categories'] as List)
          .map((item) => ProfessionalCategory.fromJson(item))
          .toList(),
      avatar: json['avatar'],
      cellphone: json['cellphone'],
      document: json['document'],
    );
  }
}
