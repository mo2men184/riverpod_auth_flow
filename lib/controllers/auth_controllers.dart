import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_firebase_auth_riverpod/services/firebase_auth_service.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController(ref.read);
});

class AuthController extends StateNotifier<User?> {
  final Reader _read;
  final FirebaseAuthService _authService = FirebaseAuthService();

  AuthController(this._read) : super(null) {
    _init();
  }

  Future<void> _init() async {
    try {
      final user = _authService.currentUser;
      if (user != null) {
        state = user;
      }
    } catch (e) {
      print('Error initializing AuthController: $e');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _authService.signInWithEmailAndPassword(email, password);
      state = userCredential.user;
    } catch (e) {
      print('Error signing in with email and password: $e');
      rethrow;
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _authService.signUpWithEmailAndPassword(email, password);
      state = userCredential.user;
    } catch (e) {
      print('Error signing up with email and password: $e');
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await _authService.signInWithGoogle();
      state = userCredential.user;
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final userCredential = await _authService.signInWithFacebook();
      state = userCredential.user;
    } catch (e) {
      print('Error signing in with Facebook: $e');
      rethrow;
    }
  }

  Future<void> signInWithApple() async {
    try {
      final userCredential = await _authService.signInWithApple();
      state = userCredential.user;
    } catch (e) {
      print('Error signing in with Apple: $e');
      rethrow;
    }
  }

  Future<void> signInWithTwitter() async {
    try {
      final userCredential = await _authService.signInWithTwitter();
      state = userCredential.user;
    } catch (e) {
      print('Error signing in with Twitter: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      state = null;
    } catch (e) {
      print('Error signing out: $e');
      rethrow;
    }
  }
}
