import 'package:get_it/get_it.dart';
import 'package:nuntium/data/data_sources/auth_data_source.dart';
import 'package:nuntium/data/data_sources/home_data_source.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource());
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
}
