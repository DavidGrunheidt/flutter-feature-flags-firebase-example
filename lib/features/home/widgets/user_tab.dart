import 'package:flutter/material.dart';
import '../home_view_model.dart';

class UserTab extends StatelessWidget {
  const UserTab({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to feature flag example app'),
    );
  }
}
