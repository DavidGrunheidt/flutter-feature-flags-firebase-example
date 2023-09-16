import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../helpers/feature_flag_keys.dart';

part 'remote_config_repository.g.dart';

class RemoteConfigRepository = _RemoteConfigRepository with _$RemoteConfigRepository;

abstract class _RemoteConfigRepository with Store {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  @observable
  bool enableMyCarTab = false;

  @observable
  bool enableMyCarMileage = false;

  @observable
  bool enableMyCityTab = false;

  Future<void> init() async {
    try {
      if (!kIsWeb) _remoteConfig.onConfigUpdated.listen(_updateConfigs, onError: (_) {});
      await _setDefaultConfigs();

      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: kDebugMode ? const Duration(minutes: 1) : const Duration(seconds: 10),
          minimumFetchInterval: kDebugMode ? const Duration(hours: 4) : const Duration(minutes: 1),
        ),
      );

      await _remoteConfig.fetchAndActivate();
    } finally {
      await _updateConfigs(RemoteConfigUpdate({}));
    }
  }

  Future<void> fetchAndUpdate() async {
    await _remoteConfig.fetchAndActivate();
    return _updateConfigs(RemoteConfigUpdate({}));
  }

  Future<void> _updateConfigs(RemoteConfigUpdate remoteConfigUpdate) async {
    if (kDebugMode) print('[RemoteConfigRepository] - updateConfigs');
    await _remoteConfig.activate();

    enableMyCarTab = _remoteConfig.getBool(kEnableMyCarTabKey);
    enableMyCityTab = _remoteConfig.getBool(kEnableMyCityTabKey);
    enableMyCarMileage = _remoteConfig.getBool(kEnableMyCarMileageKey);
  }

  Future<void> _setDefaultConfigs() async {
    return _remoteConfig.setDefaults({});
  }
}
