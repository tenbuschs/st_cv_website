import 'package:flutter/material.dart';
import 'event_lists.dart';
import 'main_layout.dart';
import 'timeline.dart';
import 'event_map.dart';

class ExperiencePage extends StatefulWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const ExperiencePage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      silvers: [
        Timeline(groupedEvents: groupByYear(getExperiences(context))),

        SliverToBoxAdapter(child: SizedBox(height: 24)),

        // Map
        EventMap(events: getExperiences(context)),

        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
