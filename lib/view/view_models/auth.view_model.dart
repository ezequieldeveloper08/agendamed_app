import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/user.dart';
import 'package:mediup/domain/repositories/auth.repository.dart';
import 'package:mediup/utils/command.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository repository;
  late final Command1 signin;
  late final Command0 signout;
  late final Command0 load;

  User? user;

  AuthViewModel({required this.repository}) {
    signin = Command1(_signin);
    load = Command0(_load);
    signout = Command0(_signout);
  }

  Future<Result> _load() async {
    try {
      var res = await repository.load();
      switch (res) {
        case Ok():
          user = res.value['user'];
          return res;
        case Error():
          return res;
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result> _signin(dynamic data) async {
    try {
      var res = await repository.signin(data);

      return res;
    } catch (error) {
      return Result.error(error as ServerException);
    }
  }

  Future<Result> _signout() async {
    try {
      await repository.signout();

      return Result.ok(null);
    } catch (error) {
      return Result.error(error as ServerException);
    } finally {
      load.execute();
    }
  }
}
