import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/category_screen.dart';
import '../screens/login_screen.dart';
import '../screens/product_list_screen.dart';

class AppRouter {
  // final LoginCubit loginCubit;
  // AppRouter(this.loginCubit);

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
      final bool loggedIn = false; // cubit
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
  );
}
