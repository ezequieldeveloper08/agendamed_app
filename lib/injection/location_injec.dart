import 'package:mediup/data/repositories/location.repository_imp.dart';
import 'package:mediup/domain/repositories/location.repository.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/view_models/location.view_model.dart';

Future<void> locationInjec() async {
  injec.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImp(apiService: injec()),
  );

  injec.registerLazySingleton<LocationViewModel>(
    () => LocationViewModel(repository: injec()),
  );
}
