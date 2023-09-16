import 'package:mobx/mobx.dart';

import '../../dependency_locator.dart';
import '../../models/user_info.dart';
import '../../repositories/analytics_repository.dart';
import '../../repositories/remote_config_repository.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final _analyticsRepository = dependencyLocator<AnalyticsRepository>();
  final _remoteConfigRepository = dependencyLocator<RemoteConfigRepository>();

  @observable
  UserInfo userInfo = const UserInfo();

  @computed
  bool get enableMyCarTab => _remoteConfigRepository.enableMyCarTab;

  @computed
  bool get enableMyCarMileage => _remoteConfigRepository.enableMyCarMileage;

  @computed
  bool get enableMyCityTab => _remoteConfigRepository.enableMyCityTab;

  @computed
  int get tabsLength => 1 + [enableMyCarTab, enableMyCityTab].where((el) => el).length;

  @action
  Future<void> setUserProperties(UserInfo user) {
    userInfo = user;
    return _analyticsRepository.setUserProperties(user);
  }
}