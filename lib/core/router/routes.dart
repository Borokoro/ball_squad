import 'package:ball_squad/features/author_books/presentation/pages/author_books_screen.dart';
import 'package:ball_squad/features/author_search/presentation/pages/author_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class Routes{
  static final RouteMap onBoardingCompleteRouteMap = RouteMap(routes: {
    AuthorSearchScreen.route: (route) => const MaterialPage<dynamic>(child: AuthorSearchScreen()),
    AuthorBooksScreen.route: (route) =>  MaterialPage(child: AuthorBooksScreen(index: int.parse(route.pathParameters['index']!),)),
  });

  static final RouteMap onboardingNotCompletedRouteMap = RouteMap(routes: const {});
}