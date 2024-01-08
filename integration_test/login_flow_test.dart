import 'package:automated_test_flutter/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Login Flow Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        "Should display Required Fields error message if user email & password is empty",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder errorTexts = find.text("Required Field");

      // Assert
      expectLater(errorTexts, findsNWidgets(2));
    });

    testWidgets(
        "Should display error message for invalid email and password on login attempt",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder emailTextField = find.byKey(const ValueKey("email"));
      Finder passwordTextField = find.byKey(const ValueKey("password"));
      await tester.enterText(emailTextField, "safdsfsdasdsad");
      await tester.enterText(passwordTextField, "pass");

      Finder loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder emailErrorText = find.text("Please enter a valid email");
      Finder passwordErrorTexts = find.text("Please enter a valid password");

      // Assert
      expectLater(emailErrorText, findsOneWidget);
      expectLater(passwordErrorTexts, findsOneWidget);
    });

    testWidgets("Should submit form when user email id and password is valid",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder emailTextField = find.byKey(const ValueKey("email"));
      Finder passwordTextField = find.byKey(const ValueKey("password"));
      await tester.enterText(emailTextField, "abiyyu@gmail.com");
      await tester.enterText(passwordTextField, "P@ssw0rd");

      Finder loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder errorTexts = find.text("Required Field");
      Finder emailErrorText = find.text("Please enter a valid email");
      Finder passwordErrorTexts = find.text("Please enter a valid password");

      // Assert
      expectLater(errorTexts, findsNothing);
      expectLater(emailErrorText, findsNothing);
      expectLater(passwordErrorTexts, findsNothing);
    });
  });
}
