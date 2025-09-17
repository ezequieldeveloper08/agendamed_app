import 'dart:convert';

import 'package:mediup/data/services/api_service.dart';
import 'package:mediup/domain/entities/user.dart';
import 'package:mediup/domain/repositories/auth.repository.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImp({required this.apiService});

  @override
  Future<Result> load() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final userData = pref.getString('user');
      final accessToken = pref.getString('access_token');

      if (accessToken != null && userData != null) {
        apiService.setToken(accessToken);
        return Result.ok({'user': User.fromJson(jsonDecode(userData))});
      } else {
        return Result.error(Exception('Usuário não está logado.'));
      }
    } catch (error) {
      return Result.error(Exception(error));
    }
  }

  @override
  Future<Result> signin(data) async {
    try {
      var res = await apiService.post('auth/login', data: data);

      User user = User.fromJson(res.data['user']);
      final pref = await SharedPreferences.getInstance();

      pref.setString('access_token', res.data['access_token']);
      pref.setString('user', jsonEncode(user.toJson()));
      apiService.setToken(res.data['access_token']);

      return Result.ok(user);
    } on ServerException catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<void> signout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('access_token');
  }
}
