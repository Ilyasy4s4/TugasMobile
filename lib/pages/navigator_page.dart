import 'package:flutter/material.dart';

import '../app_identity.dart';
import '../widgets/identity_app_bar.dart';

/// 5.3.4 Navigator
class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  Future<void> _openWithPush(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(builder: (context) => const SecondPage()),
    );

    if (!context.mounted || result == null) return;
    _showResult(context, result);
  }

  void _openNamedRoute(BuildContext context) {
    Navigator.pushNamed(context, '/secondPage');
  }

  void _showResult(BuildContext context, String result) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(result), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.3.4 Navigator'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.swap_horiz, size: 72, color: theme.colorScheme.primary),
            const SizedBox(height: 20),
            Text(
              'Navigator mengelola perpindahan halaman menggunakan stack '
              'route.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _openWithPush(context),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Navigator.push'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _openNamedRoute(context),
              icon: const Icon(Icons.route_outlined),
              label: const Text('Navigator.pushNamed'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Halaman tujuan untuk demonstrasi Navigator.push / pushNamed.
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.3.4 Navigator • Halaman Kedua'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text('Second Page', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Halaman ini dibuka dari halaman sebelumnya menggunakan '
              'Navigator.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${AppIdentity.nama} • ${AppIdentity.nim} • ${AppIdentity.kelas}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () =>
                  Navigator.pop(context, 'Kembali dari halaman kedua'),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Navigator.pop'),
            ),
          ],
        ),
      ),
    );
  }
}
