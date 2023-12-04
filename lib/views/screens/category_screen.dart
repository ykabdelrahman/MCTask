import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import 'all_categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 24),
            color: Colors.black,
          ),
        ],
        bottom: TabBar(
          tabs: const [
            Text(
              'All',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Men',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Women',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kids',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          labelPadding: const EdgeInsets.all(6),
          indicatorColor: Colors.purple,
          controller: _tabController,
        ),
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .50,
        child: const Drawer(
          child: CustomDrawer(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AllCategories(),
          AllCategories(),
          AllCategories(),
          AllCategories(),
        ],
      ),
    );
  }
}
