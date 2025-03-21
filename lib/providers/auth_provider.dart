import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  bool _isEmailVerified = false;

  AuthProvider() {
    _authService.authStateChanges.listen((User? user) {
      _user = user;
      _isEmailVerified = user?.emailVerified ?? false;
      notifyListeners();
    });
  }

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  bool get isEmailVerified => _isEmailVerified;

  Future<void> signIn(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.sendEmailVerification();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkEmailVerified() async {
    try {
      _isLoading = true;
      notifyListeners();
      _isEmailVerified = await _authService.checkEmailVerified();
      return _isEmailVerified;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> reloadUser() async {
    try {
      await _user?.reload();
      _isEmailVerified = _user?.emailVerified ?? false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error reloading user: $e');
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signOut();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
