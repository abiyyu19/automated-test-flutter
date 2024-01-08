abstract interface class Authentication {
  Future<String> login({required String email, required String password});
  Future<String> logout();
}
