import 'package:flutter/material.dart';
import 'main_layout.dart';
import 'timeline.dart';
import 'event_lists.dart';
import 'event_map.dart';

class EducationPage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const EducationPage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      toggleLocale: toggleLocale,
      locale: locale,
      silvers: [
        Timeline(groupedEvents: groupByYear(getEducations(context))),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        EventMap(events: getEducations(context)),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
