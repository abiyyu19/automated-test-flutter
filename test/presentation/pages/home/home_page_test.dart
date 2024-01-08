import 'package:automated_test_flutter/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Should display Home Page on the Center of Screen",
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginPage(),
    ));

    // Act
    Finder title = find.text("Automated Test App");

    // Assert
    expect(title, findsOneWidget);
  });
}
