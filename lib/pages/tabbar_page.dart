import 'package:flutter/material.dart';

import '../widgets/identity_app_bar.dart';

/// 5.2.5 TabBar
class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const IdentityAppBar(
          title: '5.2.5 TabBar',
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Car'),
              Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
              Tab(icon: Icon(Icons.directions_boat), text: 'Boat'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TabContent(
              icon: Icons.directions_car,
              title: 'Car Tab',
              description: 'Konten untuk kategori mobil.',
            ),
            _TabContent(
              icon: Icons.directions_bike,
              title: 'Bike Tab',
              description: 'Konten untuk kategori sepeda.',
            ),
            _TabContent(
              icon: Icons.directions_boat,
              title: 'Boat Tab',
              description: 'Konten untuk kategori kapal.',
            ),
          ],
        ),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  const _TabContent({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80, color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
