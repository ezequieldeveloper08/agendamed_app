import 'package:mediup/domain/entities/address.dart';
import 'package:mediup/domain/entities/professional.dart';

class Location {
  String id;
  String name;
  String description;
  List<String>? images;
  Address address;
  List<Professional> professionals;
  String? createdAt;
  String? updatedAt;
  LocationType type;

  Location({
    required this.address,
    required this.name,
    required this.description,
    required this.professionals,
    required this.type,
    required this.id,
    this.createdAt,
    this.images,
    this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      address: Address.fromJson(json['address']),
      professionals:
          (json['professionals'] as List<dynamic>?)
              ?.map((e) => Professional.fromJson(e))
              .toList() ??
          [],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: LocationTypeExtension.fromString(json['type']),
    );
  }
}

enum LocationType {
  hospital,
  clinica,
  laboratorio,
  consultorio,
  prontoSocorro,
  postoSaude,
  centroDiagnostico,
  unidadeBasicaSaude,
  policlinica,
  outro,
}

extension LocationTypeExtension on LocationType {
  String get label {
    switch (this) {
      case LocationType.hospital:
        return "Hospital";
      case LocationType.clinica:
        return "Clínica";
      case LocationType.laboratorio:
        return "Laboratório";
      case LocationType.consultorio:
        return "Consultório";
      case LocationType.prontoSocorro:
        return "Pronto-Socorro";
      case LocationType.postoSaude:
        return "Posto de Saúde";
      case LocationType.centroDiagnostico:
        return "Centro de Diagnóstico";
      case LocationType.unidadeBasicaSaude:
        return "Unidade Básica de Saúde";
      case LocationType.policlinica:
        return "Policlínica";
      case LocationType.outro:
        return "Outro";
    }
  }

  static LocationType fromString(String? type) {
    return LocationType.values.firstWhere(
      (e) => e.label.toLowerCase() == (type ?? '').toLowerCase(),
      orElse: () => LocationType.outro,
    );
  }
}
