import 'package:flutter/material.dart';
import 'main_layout.dart';
import 'timeline.dart';
import 'event_lists.dart';
import 'event_map.dart';
import 'l10n/app_localizations.dart';
import 'analytics.dart' as analytics;

class VolunteeringPage extends StatefulWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const VolunteeringPage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  State<VolunteeringPage> createState() => _VolunteeringPageState();
}

class _VolunteeringPageState extends State<VolunteeringPage> {
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    analytics.logPageView("volunteering");
  }

  @override
  void dispose() {
    analytics.logPageViewDuration('volunteering', _startTime);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      mainText: AppLocalizations.of(context)!.volunteering,
      lowerText: "Simon Tenbusch",
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      silvers: [
        Timeline(groupedEvents: groupByYear(getVolunteering(context))),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        EventMap(events: getVolunteering(context)),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
