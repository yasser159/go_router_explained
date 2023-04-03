import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/category_screen.dart';
import '../screens/product_list_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const CategoryScreen();
        },
        routes: [
          GoRoute(
            path: 'product_list', // /procust_list/product
            name: 'product_list',
            builder: (BuildContext context, GoRouterState state) {
              return const ProductListScreen();
            },
          ),
        ]),
    // GoRoute(
    //   path: '/product_list',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ProductListScreen();
    //   },
    // ),
  ],
);
