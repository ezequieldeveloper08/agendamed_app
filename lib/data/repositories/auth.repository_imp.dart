import 'package:mediup/data/services/api_service.dart';
import 'package:mediup/domain/entities/user.dart';
import 'package:mediup/domain/repositories/auth.repository.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';

class AuthRepositoryImp implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImp({required this.apiService});

  @override
  Future<Result> load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  Future<Result> signin(data) async {
    try {
      var res = await apiService.post('auth/login', data: data);

      User user = User.fromJson(res.data['user']);

      return Result.ok(user);
    } on ServerException catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
}
