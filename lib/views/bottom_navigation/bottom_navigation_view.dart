import 'package:flutter/material.dart';
import 'package:google_books_client/core/constants/app_strings.dart';
import 'package:google_books_client/views/favourites/favourites_page.dart';
import 'package:google_books_client/views/home/home_page.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  static const pages = <Widget>[HomePage(), FavouritesPage()];
  int _pageIndex = 0;

  void _onTap(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _pageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.homeTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppStrings.favouritesTitle,
          ),
        ],
      ),
    );
  }
}
