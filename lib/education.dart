import 'package:flutter/material.dart';
import 'main_layout.dart';
import 'timeline.dart';
import 'event_lists.dart';
import 'event_map.dart';
import 'l10n/app_localizations.dart';
import 'analytics.dart' as analytics;

class EducationPage extends StatefulWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const EducationPage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    analytics.logPageView("education");
  }

  @override
  void dispose() {
    analytics.logPageViewDuration('education', _startTime);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      mainText: AppLocalizations.of(context)!.education,
      lowerText: "Simon Tenbusch",
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      silvers: [
        Timeline(groupedEvents: groupByYear(getEducations(context))),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        EventMap(events: getEducations(context)),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
