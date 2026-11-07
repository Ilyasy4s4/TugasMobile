import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:praktikum/app_identity.dart';
import 'package:praktikum/main.dart';

void main() {
  testWidgets('AppBar beranda menampilkan identitas diri', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PraktikumApp());

    expect(find.text('Praktikum Chapter 5'), findsOneWidget);
    expect(find.text(AppIdentity.display), findsOneWidget);
  });

  testWidgets('Demo stateful counter berjalan dan identitas tetap tampil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PraktikumApp());

    await tester.tap(find.text('5.1.2 Stateful Widget'));
    await tester.pumpAndSettle();

    expect(find.text('Counter: 0'), findsOneWidget);
    expect(find.text(AppIdentity.display), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
