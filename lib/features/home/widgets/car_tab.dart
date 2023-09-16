import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../helpers/app_constants.dart';
import '../home_view_model.dart';

class CarTab extends StatelessWidget {
  const CarTab({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Observer(
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('My Car: ${userInfo.carName}'),
              const SizedBox(height: 24),
              if (viewModel.enableMyCarMileage) Text('Mileage: ${userInfo.carMileage}'),
            ],
          ),
        ),
      ),
    );
  }
}
