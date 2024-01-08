import 'package:automated_test_flutter/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Page Section - ', () {
    testWidgets("Should display a title page on the Appbar",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder title = find.text("Login Page");

      // Assert
      expect(title, findsOneWidget);
    });

    testWidgets("Should display a headline page", (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder title = find.text("Automated Test App");

      // Assert
      expect(title, findsOneWidget);
    });

    testWidgets(
      "Should have one text field form to collect user Email",
      (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(const MaterialApp(
          home: LoginPage(),
        ));

        // Act
        Finder emailTextField = find.byKey(const ValueKey("email"));

        // Assert
        expect(emailTextField, findsOneWidget);
      },
    );

    testWidgets("Should have one text field form to collect user Password",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder passwordTextField = find.byKey(const ValueKey("password"));

      // Assert
      expect(passwordTextField, findsOneWidget);
    });

    testWidgets("Should display one login button", (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginPage(),
      ));

      // Act
      Finder loginButton = find.byType(ElevatedButton);

      // Assert
      expect(loginButton, findsOneWidget);
    });

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
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();

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
