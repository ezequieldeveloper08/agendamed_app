import 'package:mediup/data/repositories/auth.repository_imp.dart';
import 'package:mediup/domain/repositories/auth.repository.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/view_models/auth.view_model.dart';

Future<void> authInjec() async {
  injec.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(apiService: injec()),
  );

  injec.registerLazySingleton<AuthViewModel>(
    () => AuthViewModel(repository: injec()),
  );
}
