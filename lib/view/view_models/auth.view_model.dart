import 'package:flutter/material.dart';
import 'package:mediup/domain/repositories/auth.repository.dart';
import 'package:mediup/utils/command.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository repository;
  late final Command1 signin;

  AuthViewModel({required this.repository}) {
    signin = Command1(_signin);
  }

  Future<Result> _signin(dynamic data) async {
    try {
      var res = await repository.signin(data);

      return res;
    } catch (error) {
      return Result.error(error as ServerException);
    }
  }
}
