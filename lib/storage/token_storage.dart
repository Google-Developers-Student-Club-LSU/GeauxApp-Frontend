import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static final _logger = Logger('TokenStorage');

  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiry,
  }) async {
    try {
      await _storage.write(key: 'access_token', value: accessToken);
      await _storage.write(key: 'refresh_token', value: refreshToken);
      await _storage.write(key: 'expiry', value: expiry.toIso8601String());
    } catch (e, stack) {
      _logger.severe('Failed to save tokens', e, stack);
    }
  }

  static Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: 'access_token');
    } catch (e, stack) {
      _logger.warning('Failed to read access token', e, stack);
      return null;
    }
  }

  static Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: 'refresh_token');
    } catch (e, stack) {
      _logger.warning('Failed to read refresh token', e, stack);
      return null;
    }
  }

  static Future<DateTime?> getExpiry() async {
    try {
      final expiryStr = await _storage.read(key: 'expiry');
      return expiryStr != null ? DateTime.parse(expiryStr) : null;
    } catch (e, stack) {
      _logger.warning('Failed to read token expiry', e, stack);
      return null;
    }
  }

  static Future<void> clear() async {
    try {
      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
      await _storage.delete(key: 'expiry');
    } catch (e, stack) {
      _logger.warning('Failed to clear tokens', e, stack);
    }
  }
}
