import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService authservice = AuthService();
  bool isLoggedIn = false;
  bool isLoading = true; // Loading while checking token at startup

  AuthState() {
    checkLoginStatus();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    setLoading(true);
    final token = await authservice.getValidAccessToken();
    isLoggedIn = token != null;
    setLoading(false);
  }


  Future<bool> loginWithBackend({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    setLoading(true);

    try {
      await authservice.loginWithTokenBackend(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );
      isLoggedIn = true;
      return true;
    } catch (e) {
      isLoggedIn = false;
      return false;
    } finally {
      setLoading(false);
    }
  }


  Future<void> logout() async {
    setLoading(true);
    notifyListeners();

    await authservice.logout();
    isLoggedIn = false;
    setLoading(false);
    notifyListeners();
  }
}
