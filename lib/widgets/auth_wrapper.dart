import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/init_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/email_verification_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  static String routeName = "auth_wrapper";

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // If authenticated but email not verified
        if (authProvider.isAuthenticated && !authProvider.isEmailVerified) {
          return const EmailVerificationScreen();
        }

        // If authenticated and email verified
        if (authProvider.isAuthenticated && authProvider.isEmailVerified) {
          return const InitScreen();
        }

        // If not authenticated, show the login screen
        return const SplashScreen();
      },
    );
  }
}
