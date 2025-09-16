import 'package:mediup/data/services/api_service.dart';
import 'package:mediup/domain/entities/professional.dart';
import 'package:mediup/domain/repositories/professional.repository.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';

class ProfessionalRepositoryImp implements ProfessionalRepository {
  final ApiService apiService;

  ProfessionalRepositoryImp({required this.apiService});

  @override
  Future<Result> create(data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Result> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result> findAll(filters) async {
    try {
      var res = await apiService.get('professionals', queryParams: filters);
      List data = (res.data['data'] as List?) ?? [];
      List<Professional> professionals = data
          .map((e) => Professional.fromJson(e))
          .toList();

      return Result.ok(professionals);
    } on ServerException catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<Result> update(data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
