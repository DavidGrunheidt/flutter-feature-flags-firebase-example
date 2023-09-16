import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        child: Observer(
          builder: (context) => Column(
            children: [
              Text('My City: ${viewModel.userInfo.city}'),
            ],
          ),
        ),
      ),
    );
  }
}
