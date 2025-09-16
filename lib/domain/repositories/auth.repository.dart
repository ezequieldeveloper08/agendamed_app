import 'package:mediup/utils/result.dart';

abstract class AuthRepository {
  Future<Result> load();
  Future<Result> signin(dynamic data);
  Future<Result> signout();
}
