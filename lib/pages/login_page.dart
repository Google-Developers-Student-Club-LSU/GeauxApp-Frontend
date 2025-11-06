import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../services/auth_service.dart';
import '../services/api_service.dart';
import 'map_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService(); 
  final ApiService _api = ApiService();    
  bool _isLoading = false;

  static final _logger = Logger('LoginPage');

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);

    try {
      // Call backend login
      final response = await http.post(
        Uri.parse('${_auth.backendBaseUrl}/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': 'user@example.com',   // Replace with actual user input
          'password': 'supersecret',     // Replace with actual user input
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Save tokens
        await _auth.loginWithTokenFromBackend(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
          expiresIn: data['expires_in'],
        );

        // Fetch user profile as example
        final profile = await _api.getUserProfile();
        if (profile != null) {
          _logger.info('User logged in: ${profile['name']}');
        }

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MapPage()),
        );
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e, stack) {
      _logger.severe('Login failed', e, stack);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton.icon(
              onPressed: _handleLogin,
              icon: const Icon(Icons.login),
              label: const Text('Sign in'),
            ),
      ),
    );
  }
}
