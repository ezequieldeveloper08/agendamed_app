import 'package:mediup/utils/result.dart';

abstract class ProfessionalRepository {
  Future<Result> findAll(dynamic filters);
  Future<Result> findOne(String id);
  Future<Result> create(dynamic data);
  Future<Result> update(dynamic data);
  Future<Result> delete(String id);
}
