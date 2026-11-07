import 'package:flutter/material.dart';

import '../app_identity.dart';
import '../widgets/identity_app_bar.dart';

/// 5.2.1 Dialog
class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  String _lastAction = 'Belum ada aksi';

  Future<void> _showDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Alert'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('This is an alert dialog.'),
              const SizedBox(height: 12),
              Text(
                '${AppIdentity.nama} • ${AppIdentity.nim}',
                style: Theme.of(dialogContext).textTheme.bodySmall,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop('Cancel'),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop('OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (!mounted) return;
    setState(() {
      _lastAction = result == null
          ? 'Dialog ditutup tanpa pilihan'
          : 'Pilihan: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.2.1 Dialog'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'Dialog menampilkan pesan atau meminta konfirmasi di atas '
              'konten aplikasi.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _showDialog,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Tampilkan AlertDialog'),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Aksi terakhir'),
                subtitle: Text(_lastAction),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
