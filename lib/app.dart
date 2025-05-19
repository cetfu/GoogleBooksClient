import 'package:flutter/material.dart';
import 'package:google_books_client/core/theme/app_theme.dart';
import 'package:google_books_client/views/bottom_navigation/bottom_navigation_view.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


class GoogleBooksClient extends StatelessWidget {
  const GoogleBooksClient({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Books Client",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: BottomNavigationView(),
      navigatorObservers: [routeObserver],
    );
  }
}