import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../services/auth_service.dart';

// ignore: constant_identifier_names
const IS_AUTHENTICATED_KEY = 'IS_AUTHENTICATED_KEY';
// ignore: constant_identifier_names
const AUTHENTICATED_USER_EMAIL_KEY = 'AUTHENTICATED_USER_EMAIL_KEY';

final sharedPrefProvider = Provider((_) async {
  return await SharedPreferences.getInstance();
});

final setAuthStateProvider = StateProvider<AuthResponse?>(
  (ref) => null,
);

final setIsAuthenticatedProvider = StateProvider.family<void, bool>(
  (ref, isAuth) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    prefs.setBool(
      IS_AUTHENTICATED_KEY,
      isAuth,
    );
  },
);

final setAuthenticatedUserProvider = StateProvider.family<void, String>(
  (ref, email) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    prefs.setString(
      AUTHENTICATED_USER_EMAIL_KEY,
      email,
    );
  },
);

final getIsAuthenticatedProvider = FutureProvider<bool>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    return prefs.getBool(IS_AUTHENTICATED_KEY) ?? false;
  },
);

final getAuthenticatedUserProvider = FutureProvider<String>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    return prefs.getString(AUTHENTICATED_USER_EMAIL_KEY) ?? '';
  },
);




final authenticationHandlerProvider = StateProvider<AuthenticationHandler>(
  (_) => AuthenticationHandler(),
);

final authLoginProvider = FutureProvider.family<bool, AuthArgs>(
  (ref, authArgs) async {
    return Future.delayed(const Duration(seconds: 2), () async {
      final authResponse = await ref.watch(authenticationHandlerProvider).login(
            authArgs,
          );
      final isAuthenticated = authResponse.statusCode == 200;
      if (isAuthenticated) {
        ref.read(setAuthStateProvider.notifier).state = authResponse;
        ref.read(setIsAuthenticatedProvider(isAuthenticated));
        ref.read(setAuthenticatedUserProvider(authResponse.authValues.email));
      } else {
        ref.read(authErrorMessageProvider.notifier).state =
            'Error occurred while login with code: ${authResponse.statusCode}';
      }

      return isAuthenticated;
    });
  },
);

final authErrorMessageProvider = StateProvider<String>(
  (_) => '',
);
