import 'package:flutter/material.dart';

import '../widgets/identity_app_bar.dart';

/// 5.2.3 TextField
class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _currentText = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const IdentityAppBar(title: '5.2.3 TextField'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Ketik sesuatu di sini...',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.edit_outlined),
                suffixIcon: _currentText.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Hapus teks',
                        icon: const Icon(Icons.clear),
                        onPressed: _controller.clear,
                      ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Nilai saat ini:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _currentText.isEmpty
                    ? Text(
                        '(kosong)',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    : SelectableText(
                        _currentText,
                        style: theme.textTheme.titleMedium,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
