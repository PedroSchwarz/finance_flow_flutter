import 'dart:async';

import 'package:finance_flow/auth/auth.dart';
import 'package:finance_flow/dashboard/dashboard.dart';
import 'package:finance_flow/groups/groups.dart';
import 'package:finance_flow/invites/invites.dart';
import 'package:finance_flow/splash/ui/view/splash_screen.dart';
import 'package:finance_flow/transactions/transactions.dart';
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
      GoRoute(
        path: '/${LoginScreen.routeName}',
        name: LoginScreen.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(path: '/${RegisterScreen.routeName}', name: RegisterScreen.routeName, builder: (context, state) => const RegisterScreen()),
      GoRoute(
        path: '/${DashboardScreen.routeName}',
        name: DashboardScreen.routeName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const DashboardScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
        routes: [
          GoRoute(path: '/${InvitesScreen.routeName}', name: InvitesScreen.routeName, builder: (context, state) => const InvitesScreen()),
          GoRoute(
            path: '/${CreateGroupScreen.routeName}',
            name: CreateGroupScreen.routeName,
            builder: (context, state) {
              final id = state.uri.queryParameters['id'];

              return CreateGroupScreen(id: id);
            },
          ),
          GoRoute(
            path: '/${GroupDetailsScreen.routeName}/:id',
            name: GroupDetailsScreen.routeName,
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              final name = state.uri.queryParameters['name'] ?? '';

              return GroupDetailsScreen(id: id, name: name);
            },
          ),
          GoRoute(
            path: '/${TransactionsScreen.routeName}',
            name: TransactionsScreen.routeName,
            builder: (context, state) => const TransactionsScreen(),
            routes: [
              GoRoute(
                path: '/${CreateTransactionScreen.routeName}',
                name: CreateTransactionScreen.routeName,
                builder: (context, state) => const CreateTransactionScreen(),
              ),
            ],
          ),
        ],
      ),
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
