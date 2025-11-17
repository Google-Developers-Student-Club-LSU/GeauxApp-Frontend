import 'dart:ui';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:geaux_app_frontend/constant.dart';
import 'package:geaux_app_frontend/screens/map_page.dart';
import 'package:geaux_app_frontend/widget/map.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../services/auth_state.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final ApiService api = ApiService();
  static final logger = Logger('LoginPage');

  Future<void> handleLogin() async {
    final authState = Provider.of<AuthState>(context, listen: false);
    Navigator.pushReplacement(context, MaterialPageRoute<void>(builder: (context) => MapPage()));
    try {
      final response = await http.get(
        Uri.parse('${authState.authservice.backendBaseUrl}/auth/microsoft-login'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Use AuthState to handle login & token storage
        final success = await authState.loginWithBackend(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
          expiresIn: data['expires_in'],
        );

        if (success) {
          final profile = await api.getUserProfile();
          if (profile != null) {
            logger.info('User logged in: ${profile['name']}');
          }

          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
          // No need to manually navigate; RootPage will rebuild automatically
        } else {
          throw Exception('Login failed inside AuthState');
        }
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e, stack) {
      logger.severe('Login failed', e, stack);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    } finally {
      if (mounted) authState.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5,),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.black12.withValues(alpha: 0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Welcome to GeauxApp",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.visible),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: authState.isLoading
                          ? const CircularProgressIndicator()
                          : MicrosoftAuthButton(
                              onPressed: () => handleLogin(),
                              style: AuthButtonStyle(
                                borderRadius: standardBorderRadius,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
