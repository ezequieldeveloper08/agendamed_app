class Address {
  String name;
  String uf;
  String city;
  String route;
  String district;
  String number;
  String zipcode;

  Address({
    required this.city,
    required this.district,
    required this.name,
    required this.number,
    required this.route,
    required this.uf,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      district: json['district'],
      name: json['name'],
      number: json['number'],
      route: json['route'],
      uf: json['uf'],
      zipcode: json['zipcode'],
    );
  }
}
