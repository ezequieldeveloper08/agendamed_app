import 'package:mediup/data/services/api_service.dart';
import 'package:mediup/domain/entities/location.dart';
import 'package:mediup/domain/repositories/location.repository.dart';
import 'package:mediup/utils/result.dart';
import 'package:mediup/utils/server_exception.dart';

class LocationRepositoryImp implements LocationRepository {
  final ApiService apiService;

  LocationRepositoryImp({required this.apiService});

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
      var res = await apiService.get('locations', queryParams: filters);
      List data = (res.data['data'] as List?) ?? [];
      List<Location> locations = data.map((e) => Location.fromJson(e)).toList();

      return Result.ok(locations);
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
