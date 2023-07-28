import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rsk1/features/auth/views/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../services/auth_service.dart';

final authControllerProvider = Provider((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthController(authService: authService, ref: ref);
});

final authControllerGetUsetDetails = FutureProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider);
  },
);

class AuthController {
  final AuthService authService;
  final ProviderRef ref;

  AuthController({required this.authService, required this.ref});

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String password_confirm,

  }) {
    authService.signUpUser(
        context: context,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        password_confirm: password_confirm

       );
  }

  Future<UserModel> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) {
    return authService.signInUser(
        context: context, email: email, password: password);
  }

  void logout({
    required BuildContext context,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('x-auth-token', '');
    await sp.setString('user-id', '');

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }
}
