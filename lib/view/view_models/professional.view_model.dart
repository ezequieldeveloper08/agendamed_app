import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/professional.dart';
import 'package:mediup/domain/repositories/professional.repository.dart';
import 'package:mediup/utils/command.dart';
import 'package:mediup/utils/result.dart';

class ProfessionalViewModel extends ChangeNotifier {
  final ProfessionalRepository repository;

  late final Command1<void, Map<String, dynamic>> findAll;

  List<Professional> professionals = [];

  ProfessionalViewModel({required this.repository}) {
    findAll = Command1(_findAll);
  }

  Future<Result> _findAll(Map<String, dynamic> filters) async {
    try {
      var res = await repository.findAll(filters);

      switch (res) {
        case Ok():
          professionals = res.value;
          return res;
        case Error():
          return res;
      }
    } finally {
      notifyListeners();
    }
  }
}
