import 'package:flutter/material.dart';

import '../app_identity.dart';
import '../widgets/identity_app_bar.dart';

/// 5.3.2 BottomSheet
class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'This is a Bottom Sheet',
                  textAlign: TextAlign.center,
                  style: Theme.of(sheetContext).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  '${AppIdentity.nama} • ${AppIdentity.nim}',
                  textAlign: TextAlign.center,
                  style: Theme.of(sheetContext).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.share_outlined),
                  title: const Text('Bagikan'),
                  onTap: () => Navigator.of(sheetContext).pop(),
                ),
                ListTile(
                  leading: const Icon(Icons.filter_alt_outlined),
                  title: const Text('Filter data'),
                  onTap: () => Navigator.of(sheetContext).pop(),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.3.2 BottomSheet'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.vertical_align_bottom,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'BottomSheet adalah panel yang muncul dari bagian bawah layar '
              'untuk menampilkan opsi tambahan.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _showBottomSheet(context),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Tampilkan BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
