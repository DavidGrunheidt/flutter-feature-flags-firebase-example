import 'package:get_it/get_it.dart';

import '../../repositories/remote_config_repository.dart';
import '../repositories/analytics_repository.dart';

GetIt dependencyLocator = GetIt.instance;

Future<void> setupRepositoryDependencies() async {
  dependencyLocator.registerLazySingleton<RemoteConfigRepository>(RemoteConfigRepository.new);
  dependencyLocator.registerLazySingleton<AnalyticsRepository>(AnalyticsRepository.new);

  await dependencyLocator<AnalyticsRepository>().init();
  await dependencyLocator<RemoteConfigRepository>().init();
}
