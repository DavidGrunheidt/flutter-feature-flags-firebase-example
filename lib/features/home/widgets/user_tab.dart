import 'package:flutter/material.dart';

import '../../../models/user_info.dart';
import '../home_view_model.dart';

class UserTab extends StatelessWidget {
  const UserTab({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Empty UserInfo'),
              onPressed: () => viewModel.setUserProperties(
                const UserInfo(),
              ),
            ),
            ElevatedButton(
              child: const Text('CR-V, 1000km, New York'),
              onPressed: () => viewModel.setUserProperties(
                const UserInfo(carName: 'Honda CR-V', carMileage: 10000, city: 'New York'),
              ),
            ),
            ElevatedButton(
              child: const Text('Silverado, 25000km, Phoenix'),
              onPressed: () => viewModel.setUserProperties(
                const UserInfo(carName: 'Chevrolet Silverado', carMileage: 25000, city: 'Phoenix'),
              ),
            ),
            ElevatedButton(
              child: const Text('RAV4, 50000km, Dallas'),
              onPressed: () => viewModel.setUserProperties(
                const UserInfo(carName: 'Toyota RAV4', carMileage: 50000, city: 'Dallas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
