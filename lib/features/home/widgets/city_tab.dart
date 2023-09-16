import 'package:flutter/material.dart';

import '../../../helpers/app_constants.dart';
import '../home_view_model.dart';

class CityTab extends StatelessWidget {
  const CityTab({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('My City: ${userInfo.city}'),
          ],
        ),
      ),
    );
  }
}
