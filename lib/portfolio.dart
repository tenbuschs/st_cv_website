import 'package:flutter/material.dart';
import 'main_layout.dart';
import 'timeline.dart';
import 'event_lists.dart';

class PortfolioPage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const PortfolioPage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        mainText: "Portfolio",
        lowerText: "Simon Tenbusch",
        toggleLocale: toggleLocale,
        locale: locale,
        silvers: [

        ]
    );
  }
}
