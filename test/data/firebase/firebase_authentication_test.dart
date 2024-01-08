import 'dart:async';

import 'package:automated_test_flutter/data/firebase/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseUser extends Mock implements User {}

final MockFirebaseUser _mockUser = MockFirebaseUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User?> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  // final MockUserCredential mockCredential = MockUserCredential();

  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final FirebaseAuthentication firebaseAuthentication =
      FirebaseAuthentication(firebaseAuth: mockFirebaseAuth);

  setUp(() {});

  tearDown(() {});

  test('Emit Users', () async {
    expectLater(
      firebaseAuthentication.user,
      emitsInOrder([_mockUser]),
    );
  });

  test('Login - Successful', () async {
    // Arrange

    // when(
    //   mockFirebaseAuth.signInWithEmailAndPassword(
    //       email: 'abiyyu@gmail.com', password: "P@ssw0rd"),
    // ).thenAnswer((realInvocation) {
    //   final Completer<UserCredential> completer = Completer();
    //   completer.complete(null);
    //   return completer.future;
    // });

    // Act
    final result = await firebaseAuthentication.login(
      email: 'abiyyu@gmail.com',
      password: 'P@ssw0rd',
    );

    // Assert
    expect(result, 'u2nT81D87JYPIUKm3Ph5baOCvGY2');
  });

  test('Login - Failed', () async {
    // Arrange

    // when(
    //   mockFirebaseAuth.signInWithEmailAndPassword(
    //       email: 'abiyyu@gmail.com', password: "P@ssw0rd"),
    // ).thenAnswer((realInvocation) => throw FirebaseAuthException(
    //     code: 'code', message: 'Your expected error message'));

    // Act
    final result = await firebaseAuthentication.login(
      email: 'fulan@gmail.com',
      password: 'fulan123',
    );

    // Assert
    expect(result, 'Your expected error message');
  });

  test('Logout - Successful', () async {
    // Act
    final result = await firebaseAuthentication.logout();

    // Assert
    expect(result, 'User logged out');
  });
}
