import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/location.dart';
import 'package:mediup/domain/repositories/location.repository.dart';
import 'package:mediup/utils/command.dart';
import 'package:mediup/utils/result.dart';

class LocationViewModel extends ChangeNotifier {
  final LocationRepository repository;

  late final Command1<void, Map<String, dynamic>> findAll;

  List<Location> locations = [];

  LocationViewModel({required this.repository}) {
    findAll = Command1(_findAll);
  }

  Future<Result> _findAll(Map<String, dynamic> filters) async {
    try {
      var res = await repository.findAll(filters);

      switch (res) {
        case Ok():
          locations = res.value;
          return res;
        case Error():
          return res;
      }
    } finally {
      notifyListeners();
    }
  }
}
