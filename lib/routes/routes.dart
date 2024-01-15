import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditofundraising/views/home_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
  ],
);
