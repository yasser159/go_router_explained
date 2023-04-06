import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_explained/cubits/login_state.dart';

import '../cubits/login_cubit.dart';
import '../screens/category_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_list_screen.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const CategoryScreen();
          },
          routes: [
            GoRoute(
              path: 'product_list/:category', // /procust_list/product
              name: 'product_list',
              builder: (BuildContext context, GoRouterState state) {
                return ProductListScreen(
                  category: state.params['category']!,
                  asc: state.queryParams['sort'] == 'asc',
                  quantity: int.parse(state.queryParams['filter'] ?? '0'),
                );
              },
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
// check if user is logged in.
        final bool loggedIn =
            loginCubit.state.status == AuthStatus.authenticated; // cubit
// Check if the user is logged in.
        final bool loggingIn = state.subloc == '/login';

        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }
        if (loggingIn) {
          return '/';
        }
        return null;
      },
      refreshListenable: GoRouterRefreshStream(loginCubit.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
