import 'package:flutter/material.dart';

import '../app_identity.dart';
import '../widgets/identity_app_bar.dart';
import 'bottom_nav_page.dart';
import 'bottom_sheet_page.dart';
import 'dialog_page.dart';
import 'drawer_page.dart';
import 'dropdown_page.dart';
import 'navigator_page.dart';
import 'snackbar_page.dart';
import 'stateful_page.dart';
import 'stateless_page.dart';
import 'tabbar_page.dart';
import 'textfield_page.dart';

/// Halaman utama yang menjadi indeks seluruh praktikum Chapter 5.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  static const List<_Section> _sections = <_Section>[
    _Section(
      title: '5.1 Stateless & Stateful Widget',
      items: <_DemoItem>[
        _DemoItem(
          title: '5.1.1 Stateless Widget',
          subtitle: 'Widget statis tanpa state internal',
          icon: Icons.widgets_outlined,
          page: StatelessPage(),
        ),
        _DemoItem(
          title: '5.1.2 Stateful Widget',
          subtitle: 'Counter App dengan setState()',
          icon: Icons.add_circle_outline,
          page: StatefulPage(),
        ),
      ],
    ),
    _Section(
      title: '5.2 Komponen UI Interaktif',
      items: <_DemoItem>[
        _DemoItem(
          title: '5.2.1 Dialog',
          subtitle: 'AlertDialog untuk pesan dan konfirmasi',
          icon: Icons.chat_bubble_outline,
          page: DialogPage(),
        ),
        _DemoItem(
          title: '5.2.2 SnackBar',
          subtitle: 'Notifikasi singkat di bawah layar',
          icon: Icons.notifications_active_outlined,
          page: SnackBarPage(),
        ),
        _DemoItem(
          title: '5.2.3 TextField',
          subtitle: 'Input teks dengan TextEditingController',
          icon: Icons.edit_outlined,
          page: TextFieldPage(),
        ),
        _DemoItem(
          title: '5.2.4 Dropdown',
          subtitle: 'DropdownButton untuk pilihan tunggal',
          icon: Icons.arrow_drop_down_circle_outlined,
          page: DropdownPage(),
        ),
        _DemoItem(
          title: '5.2.5 TabBar',
          subtitle: 'Navigasi horizontal dengan TabBarView',
          icon: Icons.tab_outlined,
          page: TabBarPage(),
        ),
      ],
    ),
    _Section(
      title: '5.3 Navigasi Antar Halaman',
      items: <_DemoItem>[
        _DemoItem(
          title: '5.3.1 BottomNavigationBar',
          subtitle: 'Menu navigasi di bagian bawah layar',
          icon: Icons.dashboard_outlined,
          page: BottomNavPage(),
        ),
        _DemoItem(
          title: '5.3.2 BottomSheet',
          subtitle: 'Panel geser dari bawah layar',
          icon: Icons.vertical_align_bottom,
          page: BottomSheetPage(),
        ),
        _DemoItem(
          title: '5.3.3 Drawer',
          subtitle: 'Panel navigasi dari sisi kiri',
          icon: Icons.menu_open,
          page: DrawerPage(),
        ),
        _DemoItem(
          title: '5.3.4 Navigator',
          subtitle: 'Navigator.push dan pushNamed',
          icon: Icons.swap_horiz,
          page: NavigatorPage(),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IdentityAppBar(title: 'Praktikum Chapter 5'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          const _IdentityCard(),
          const SizedBox(height: 20),
          Text(
            'Pilih materi praktikum',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          for (final section in _sections) ...[
            const SizedBox(height: 16),
            _SectionHeader(title: section.title),
            const SizedBox(height: 8),
            for (final item in section.items) _DemoTile(item: item),
          ],
        ],
      ),
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xFF1E3A8A), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppIdentity.nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'NIM ${AppIdentity.nim} • ${AppIdentity.kelas}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12.5),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Chapter 5 – Manajemen & Navigasi State',
                  style: TextStyle(color: Colors.white70, fontSize: 11.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      style: theme.textTheme.titleSmall?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _DemoTile extends StatelessWidget {
  const _DemoTile({required this.item});

  final _DemoItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(item.icon, color: theme.colorScheme.onPrimaryContainer),
        ),
        title: Text(item.title),
        subtitle: Text(item.subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => item.page),
          );
        },
      ),
    );
  }
}

class _Section {
  const _Section({required this.title, required this.items});

  final String title;
  final List<_DemoItem> items;
}

class _DemoItem {
  const _DemoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;
}
