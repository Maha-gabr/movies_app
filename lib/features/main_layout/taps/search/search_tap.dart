import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_assets.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(AppAssets.emptyImage),
        ),
      ],
    );
  }
}
