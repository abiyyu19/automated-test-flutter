import 'package:automated_test_flutter/presentation/pages/login/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Section - ', () {
    test('validate for empty email id', () {
      // Arrange & Act
      var result = Validator.validateEmail('');

      // Assert
      expect(result, "Required Field");
    });

    test('validate for invalid email id', () {
      // Arrange & Act
      var result = Validator.validateEmail('safdsfsdasdsad');

      // Assert
      expect(result, "Please enter a valid email");
    });

    test('validate for valid email id', () {
      // Arrange & Act
      var result = Validator.validateEmail('abiyyu@gmail.com');

      // Assert
      expect(result, null);
    });
  });

  group('Password Section - ', () {
    test('validate for empty password', () {
      // Arrange & Act
      var result = Validator.validatePassword('');

      // Assert
      expect(result, "Required Field");
    });

    test('validate for invalid password', () {
      // Arrange & Act
      var result = Validator.validatePassword('pass');

      // Assert
      expect(result, "Please enter a valid password");
    });

    test('validate for valid password', () {
      // Arrange & Act
      var result = Validator.validatePassword('P@ssw0rd');

      // Assert
      expect(result, null);
    });
  });
}
