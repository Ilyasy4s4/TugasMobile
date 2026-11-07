import 'package:flutter/material.dart';

import '../widgets/identity_app_bar.dart';

/// 5.3.1 BottomNavigationBar
class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  static const List<_NavItem> _items = <_NavItem>[
    _NavItem(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      description: 'Halaman utama aplikasi.',
    ),
    _NavItem(
      label: 'Search',
      icon: Icons.search_outlined,
      selectedIcon: Icons.search,
      description: 'Halaman pencarian data.',
    ),
    _NavItem(
      label: 'Profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      description: 'Halaman profil pengguna.',
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = _items[_currentIndex];

    return Scaffold(
      appBar: IdentityAppBar(
        title: '5.3.1 BottomNavigationBar • ${current.label}',
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Center(
          key: ValueKey<int>(_currentIndex),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                current.selectedIcon,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(current.label, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                current.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Selected index: $_currentIndex',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                activeIcon: Icon(item.selectedIcon),
                label: item.label,
              ),
            )
            .toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.description,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String description;
}
