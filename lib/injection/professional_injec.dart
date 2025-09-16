import 'package:mediup/data/repositories/professional.repository_imp.dart';
import 'package:mediup/domain/repositories/professional.repository.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/view_models/professional.view_model.dart';

Future<void> professionalInjec() async {
  injec.registerLazySingleton<ProfessionalRepository>(
    () => ProfessionalRepositoryImp(apiService: injec()),
  );

  injec.registerLazySingleton<ProfessionalViewModel>(
    () => ProfessionalViewModel(repository: injec()),
  );
}
