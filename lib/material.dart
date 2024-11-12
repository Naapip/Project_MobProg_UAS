import 'package:flutter_test/flutter_test.dart';
import 'package:project_mobprog_uas/main.dart';

void main() {
  testWidgets('Testing contract screen displays and I AGREE button works',
      (WidgetTester tester) async {
    // Build the TodoContractApp and trigger a frame.
    await tester.pumpWidget(TodoContractApp());

    // Verify that the text "Let's make a contract" is displayed.
    expect(find.text("Let's make a contract"), findsOneWidget);

    // Verify that the "I AGREE" button is present.
    expect(find.text("I AGREE"), findsOneWidget);

    // Tap the "I AGREE" button and trigger a frame.
    await tester.tap(find.text("I AGREE"));
    await tester.pump();

    // Here you can add additional assertions if there are changes expected
    // after the "I AGREE" button is tapped.
  });
}
