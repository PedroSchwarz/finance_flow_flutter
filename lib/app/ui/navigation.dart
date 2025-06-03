import 'dart:async';

import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/splash/ui/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter({required AuthRepository authRepository}) {
  List<String> authWhiteList = [SplashScreen.routeName, LoginScreen.routeName, RegisterScreen.routeName];

  final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/${SplashScreen.routeName}',
    refreshListenable: GoRouterRefreshStreamListenable(authRepository.currentUser.distinct()),
    redirect: (context, state) {
      if (authWhiteList.contains(state.topRoute?.name)) {
        return null;
      }

      if (authRepository.currentUser.value == null) {
        return '/${LoginScreen.routeName}';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/${SplashScreen.routeName}', name: SplashScreen.routeName, builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/${LoginScreen.routeName}', name: LoginScreen.routeName, builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/${RegisterScreen.routeName}', name: RegisterScreen.routeName, builder: (context, state) => const RegisterScreen()),
    ],
  );
  return router;
}

class GoRouterRefreshStreamListenable extends ChangeNotifier {
  GoRouterRefreshStreamListenable(Stream<Object?> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((value) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
