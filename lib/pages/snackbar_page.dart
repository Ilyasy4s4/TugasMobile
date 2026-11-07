import 'package:flutter/material.dart';

import '../widgets/identity_app_bar.dart';

/// 5.2.2 SnackBar
class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.2.2 SnackBar'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active_outlined,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'SnackBar adalah notifikasi singkat yang muncul di bagian bawah '
              'layar dan hilang otomatis.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _showSnackBar(context, 'This is a SnackBar'),
              icon: const Icon(Icons.info_outline),
              label: const Text('Tampilkan SnackBar'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _showSnackBar(context, 'Aksi berhasil disimpan'),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Contoh aksi berhasil'),
            ),
          ],
        ),
      ),
    );
  }
}
