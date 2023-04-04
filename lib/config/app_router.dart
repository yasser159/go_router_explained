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
        ]),
    // GoRoute(
    //   path: '/product_list',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ProductListScreen();
    //   },
    // ),
  ],
);
