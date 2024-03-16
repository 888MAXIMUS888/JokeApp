import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joke_app/generated/l10n.dart';
import 'package:joke_app/presentation/views/category/category_view.dart';
import 'package:joke_app/presentation/views/favorite_view/favorites_view.dart';
import 'package:joke_app/presentation/views/search/search_view.dart';

import '../../domain/entities/bottom_nav_bar_item.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/main_scaffold.dart';

class MainView extends StatefulWidget {
  static const int categoryViewIndex = 0;
  static const int searchViewIndex = 1;
  static const int favoritesViewIndex = 2;

  static MainView builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const MainView();
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late final TabController _controller;
  final int _bottomNavBarLength = 3;
  final int _currentTabIndex = 0;
  final List<BottomNavBarItem> _bottomNavBarItems = [];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        length: _bottomNavBarLength,
        vsync: this,
        initialIndex: _currentTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    _initBottomNavBarItems(context);
    return MainScaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: _controller,
        tabs: _navBarsItems(),
        onItemSelected: (index) {
          _controller.index = index;
        },
      ),
      body: DefaultTabController(
        length: _bottomNavBarLength,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: _buildScreens(),
        ),
      ),
    );
  }

  List<Widget> _buildScreens() =>
      _bottomNavBarItems.map((e) => e.view).toList();

  List<Widget> _navBarsItems() => _bottomNavBarItems
      .map((e) => Tab(
            icon: e.icon,
            text: e.title,
          ))
      .toList();

  void _initBottomNavBarItems(BuildContext context) {
    _bottomNavBarItems.add(
      BottomNavBarItem(
          icon: const Icon(Icons.category),
          title: S.of(context).category,
          view: const CategoryView(),
          index: MainView.categoryViewIndex),
    );
    _bottomNavBarItems.add(
      BottomNavBarItem(
          icon: const Icon(Icons.search),
          title: S.of(context).search,
          view: const SearchView(),
          index: MainView.searchViewIndex),
    );
    _bottomNavBarItems.add(
      BottomNavBarItem(
          icon: const Icon(Icons.favorite),
          title: S.of(context).favorites,
          view: const FavoritesView(),
          index: MainView.favoritesViewIndex),
    );
  }
}
