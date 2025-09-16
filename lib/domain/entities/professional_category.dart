import 'package:flutter/material.dart';

class ProfessionalCategory {
  int id;
  String name;
  String? description;
  IconData? icon;

  ProfessionalCategory({
    required this.id,
    required this.name,
    this.description,
    this.icon,
  });

  factory ProfessionalCategory.fromJson(Map<String, dynamic> json) {
    return ProfessionalCategory(
      description: json['description'],
      id: json['id'],
      name: json['name'],
    );
  }
}

final List<ProfessionalCategory> medicalSpecialties = [
  ProfessionalCategory(id: 1, name: "Todos", icon: Icons.medical_services),
  ProfessionalCategory(id: 2, name: "Cardiologista", icon: Icons.favorite),
  ProfessionalCategory(
    id: 3,
    name: "Dentista",
    icon: Icons.medical_services,
  ), // não há ícone de dente, usamos genérico
  ProfessionalCategory(
    id: 4,
    name: "Nefrologista",
    icon: Icons.opacity,
  ), // representando rim/fluido
  ProfessionalCategory(
    id: 5,
    name: "Gastroenterologista",
    icon: Icons.food_bank,
  ),
  ProfessionalCategory(id: 6, name: "Pneumologista", icon: Icons.air),
  ProfessionalCategory(id: 7, name: "Neurologista", icon: Icons.psychology),
  ProfessionalCategory(id: 8, name: "Psiquiatra", icon: Icons.self_improvement),
  ProfessionalCategory(id: 9, name: "Hepatologista", icon: Icons.healing),
  ProfessionalCategory(
    id: 10,
    name: "Dermatologista",
    icon: Icons.brush,
  ), // Skin icon requires Flutter 3.13+, use Icons.brush as fallback
  ProfessionalCategory(
    id: 11,
    name: "Oftalmologista",
    icon: Icons.remove_red_eye,
  ),
  ProfessionalCategory(
    id: 12,
    name: "Ortopedista",
    icon: Icons.accessibility_new,
  ), // representando ossos
  ProfessionalCategory(id: 13, name: "Pediatra", icon: Icons.child_care),
  ProfessionalCategory(
    id: 14,
    name: "Endocrinologista",
    icon: Icons.bloodtype,
  ), // representando hormônios
  ProfessionalCategory(id: 15, name: "Ginecologista", icon: Icons.female),
  ProfessionalCategory(
    id: 16,
    name: "Urologista",
    icon: Icons.boy,
  ), // aproximado, não há ícone direto
  ProfessionalCategory(
    id: 17,
    name: "Otorrinolaringologista",
    icon: Icons.hearing,
  ),
];
