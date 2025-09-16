import 'package:mediup/config/app_config.dart';
import 'package:mediup/data/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mediup/injection/auth_inject.dart';
import 'package:mediup/injection/professional_injec.dart';

final injec = GetIt.instance;

Future<void> initInjec() async {
  injec.registerLazySingleton<ApiService>(
    () => ApiService(baseUrl: AppConfig.apiBaseUrl),
  );

  await authInjec();
  await professionalInjec();
}
