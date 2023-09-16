import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

import '../dependency_locator.dart';
import '../models/user_info.dart';
import 'remote_config_repository.dart';

class AnalyticsRepository {
  static final analytics = FirebaseAnalytics.instance;

  final _remoteConfigRepository = dependencyLocator<RemoteConfigRepository>();

  Future<void> init() => analytics.setAnalyticsCollectionEnabled(kReleaseMode);

  Future<void> setUserProperties(UserInfo user) async {
    if (kDebugMode) print('[AnalyticsRepository] - setUserProperties ${user.toJson()}');
    for (final userProperty in user.toJson().entries) {
      await analytics.setUserProperty(name: userProperty.key, value: userProperty.value.toString());
    }

    return _remoteConfigRepository.fetchAndUpdate();
  }
}
