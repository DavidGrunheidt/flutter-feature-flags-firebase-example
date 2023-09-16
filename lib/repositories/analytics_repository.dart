import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

import '../helpers/app_constants.dart';
import '../models/user_info.dart';

class AnalyticsRepository {
  static final analytics = FirebaseAnalytics.instance;

  Future<void> init() {
    setUserProperties(userInfo);
    return analytics.setAnalyticsCollectionEnabled(kReleaseMode);
  }

  Future<void> setUserProperties(UserInfo userInfo) async {
    if (kDebugMode) print('[AnalyticsRepository] - setUserProperties ${userInfo.toJson()}');

    for (final userProperty in userInfo.toJson().entries) {
      await analytics.setUserProperty(name: userProperty.key, value: userProperty.value.toString());
    }
  }
}
