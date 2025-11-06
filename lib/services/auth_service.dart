import 'dart:convert';
import 'package:http/http.dart' as http;
import 'token_storage.dart';
import 'package:logging/logging.dart';

class AuthService {
  final String backendBaseUrl = 'https://api.myapp.com'; // Update to your backend URL
  static final _logger = Logger('AuthService');

  Future<void>? _refreshFuture;

  Future<void> loginWithTokenFromBackend({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    try {
      await TokenStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiry: DateTime.now().add(Duration(seconds: expiresIn)),
      );
      _logger.info('Token saved successfully');
    } catch (e, stack) {
      _logger.severe('Failed to save token', e, stack);
      rethrow;
    }
  }

  Future<void> refreshAccessToken() async {
    if (_refreshFuture != null) return _refreshFuture!;
    _refreshFuture = _doRefreshAccessToken();
    try {
      await _refreshFuture;
    } finally {
      _refreshFuture = null;
    }
  }

  Future<void> _doRefreshAccessToken() async {
    final refreshToken = await TokenStorage.getRefreshToken();
    if (refreshToken == null) {
      await TokenStorage.clear();
      _logger.warning('No refresh token found, cleared stored tokens');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$backendBaseUrl/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh_token': refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await TokenStorage.saveTokens(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
          expiry: DateTime.now().add(Duration(seconds: data['expires_in'])),
        );
        _logger.info('Access token refreshed successfully');
      } else {
        await TokenStorage.clear();
        _logger.warning('Refresh token invalid or expired, cleared stored tokens');
        throw Exception("Refresh token expired or invalid");
      }
    } catch (e, stack) {
      await TokenStorage.clear();
      _logger.severe('Error refreshing access token', e, stack);
      rethrow;
    }
  }

  Future<String?> getValidAccessToken() async {
    final accessToken = await TokenStorage.getAccessToken();
    final expiry = await TokenStorage.getExpiry();

    if (accessToken == null || expiry == null) return null;

    if (DateTime.now().isAfter(expiry)) {
      try {
        await refreshAccessToken();
      } catch (_) {
        _logger.warning('Failed to refresh expired access token');
        return null;
      }
      return await TokenStorage.getAccessToken();
    }

    return accessToken;
  }
}
