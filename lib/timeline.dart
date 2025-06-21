import 'package:flutter/material.dart';
import 'event_lists.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart';

class Timeline extends StatelessWidget {
  final Map<String, List<CvEvent>> groupedEvents;

  const Timeline({
    super.key,
    required this.groupedEvents,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, GlobalKey> eventKeys = {};

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final entry = groupedEvents.entries.elementAt(index);
        final isLast = entry.key == groupedEvents.keys.last;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline visual
              Container(
                width: 60,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (!isLast)
                      Container(
                        height: 80.0 * entry.value.length,
                        width: 2,
                        color: Colors.grey[700],
                      ),
                  ],
                ),
              ),
              // Expandable event tiles
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    ...entry.value.map((exp) {
                      final key = GlobalKey();
                      eventKeys[exp.id] = key;
                      return Container(
                        key: key,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ExpansionTile(
                          collapsedBackgroundColor: Colors.grey[900],
                          backgroundColor: Colors.grey[850],
                          leading: _categoryIcon(exp.category),
                          title: Text(
                            exp.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${formatPeriod(exp.startDate, exp.endDate, context)} • ${exp.company} • ${exp.location}',
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16.0,
                                top: 16.0,
                                left: 16,
                                right: 16,
                              ),
                              child: Text(
                                exp.description,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            if (exp.highlights.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0, left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Highlights:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...exp.highlights.map(
                                      (h) => Row(
                                        children: [
                                          const Text(
                                            '• ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Expanded(child: Text(h)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (exp.references.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0, left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Reference on request:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ...exp.references.map(
                                          (h) => Row(
                                        children: [
                                          const Text(
                                            '• ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Expanded(child: Text(h)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (exp.imageAssets.isNotEmpty)
                              SizedBox(
                                height: 160,
                                child: PageView.builder(
                                  itemCount: exp.imageAssets.length,
                                  itemBuilder:
                                      (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 15.0,
                                        ),
                                        child: Image.asset(
                                          exp.imageAssets[index],
                                        ),
                                      ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      }, childCount: groupedEvents.length),
    );
  }
}

String formatPeriod(String startDate, String? endDate, BuildContext context) {
  final locale = Localizations.localeOf(context).toString();
  final startDt = DateTime.parse(startDate);
  final endDt = endDate == null ? DateTime.now() : DateTime.parse(endDate);

  final start = DateFormat.yMMM(locale).format(startDt);
  final endStr = endDate == null
      ? AppLocalizations.of(context)!.currentlyWorking
      : DateFormat.yMMM(locale).format(endDt);

  int totalMonths = (endDt.year - startDt.year) * 12 + (endDt.month - startDt.month);
  if (endDt.day < startDt.day) totalMonths--;

  final years = totalMonths ~/ 12;
  final months = totalMonths % 12;

  String duration = '';
  if (years > 0) {
    duration += '$years year${years > 1 ? 's' : ''}';
  }
  if (months > 0) {
    if (duration.isNotEmpty) duration += ' ';
    duration += '$months month${months > 1 ? 's' : ''}';
  }
  if (duration.isEmpty) duration = '<1 month';

  return '$start – $endStr ($duration)';
}
// Function to return an icon based on the event category
Icon _categoryIcon(String category) {
  // This function returns different icons based on the category
  switch (category) {
    case 'job':
      return const Icon(
        Icons.work,
        color: Color(0xFF2D6045),
        size: 30,
      );
    case 'part-time':
      return const Icon(
        Icons.work,
        color: Color(0xFF2D6045),
        size: 30,
      );
    case 'seasonal':
      return const Icon(
        Icons.av_timer,
        color: Color(0xFF2D6045),
        size: 30,
      );
    case 'uni':
      return const Icon(
        Icons.school,
        color: Color(0xFF4A6A8A), //Color(0xFF354F6B), // Slate Blue
        size: 30,
      );
    case 'volunteer':
      return const Icon(
        Icons.volunteer_activism,
        color: Color(0xFFC57B57), // Rusty Orange
        size: 30,
      );
    case 'internship':
      return const Icon(
        Icons.business_center,
        color: Color(0xFF2D6045),
        size: 30,
      );
    default:
      return const Icon(
        Icons.work,
        color: Color(0xFF2D6045),
        size: 30,
      );
  }
}
