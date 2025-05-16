import 'package:flutter/material.dart';
import 'package:google_books_client/core/theme/app_sizes.dart';

class LayoutView extends StatelessWidget {
  final Widget child;

  const LayoutView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(padding: AppSizes.layoutInsets, child: child),
    );
  }
}
