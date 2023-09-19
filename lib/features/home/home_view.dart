import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_view_model.dart';
import 'widgets/car_tab.dart';
import 'widgets/city_tab.dart';
import 'widgets/home_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => DefaultTabController(
        length: _viewModel.tabsLength,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Feature Flags example'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                const Tab(
                  icon: Icon(Icons.home),
                  child: Text('Home'),
                ),
                if (_viewModel.enableMyCarTab)
                  const Tab(
                    icon: Icon(Icons.car_rental_outlined),
                    child: Text('My Car'),
                  ),
                if (_viewModel.enableMyCityTab)
                  const Tab(
                    icon: Icon(Icons.car_rental_outlined),
                    child: Text('My City'),
                  ),
              ],
            ),
          ),
          body: Center(
            child: TabBarView(
              children: [
                HomeTab(viewModel: _viewModel),
                if (_viewModel.enableMyCarTab) CarTab(viewModel: _viewModel),
                if (_viewModel.enableMyCityTab) CityTab(viewModel: _viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
