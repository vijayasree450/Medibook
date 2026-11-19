import 'package:flutter_test/flutter_test.dart';
import 'package:medibook/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MediBookApp());
    expect(find.text('Find Your Doctor'), findsOneWidget);
  });
}
