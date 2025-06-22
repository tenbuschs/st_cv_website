import 'package:flutter/material.dart';
import 'event_lists.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class Timeline extends StatelessWidget {
  final Map<String, List<CvEvent>> groupedEvents;

  const Timeline({super.key, required this.groupedEvents});

  @override
  Widget build(BuildContext context) {
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
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    if (!isLast)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height:
                            90.0 *
                            entry.value.length, // Make this dynamic if needed
                        width: 3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.grey[700]!, Colors.grey[500]!],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              /*Container(
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
                        height: 90.0 * entry.value.length,
                        width: 2,
                        color: Colors.grey[700],
                      ),
                  ],
                ),
              ),*/
              // Expandable event tiles
              ExpandableEventTile(entry: entry),
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
  final endStr =
      endDate == null
          ? AppLocalizations.of(context)!.currentlyWorking
          : DateFormat.yMMM(locale).format(endDt);

  int totalMonths =
      (endDt.year - startDt.year) * 12 + (endDt.month - startDt.month);

  if (endDt.day >= 15) totalMonths++;

  final years = totalMonths ~/ 12;
  final months = totalMonths % 12;

  String duration = '';
  String yearsStr = AppLocalizations.of(context)!.years;
  String yearStr = AppLocalizations.of(context)!.year;
  String monthsStr = AppLocalizations.of(context)!.months;
  String monthStr = AppLocalizations.of(context)!.month;

  if (years > 0) {
    if (years > 1) {
      duration += '$years $yearsStr';
    } else {
      duration += '$years $yearStr';
    }
  }
  if (months > 0) {
    if (duration.isNotEmpty) duration += ' ';
    if (months > 1) {
      duration += '$months $monthsStr';
    } else {
      duration += '$months $monthStr';
    }
  }
  if (duration.isEmpty) duration = '<1 $monthStr';

  return '$start – $endStr ($duration)';
}

// Function to return an icon based on the event category
Icon _categoryIcon(String category) {
  // This function returns different icons based on the category
  switch (category) {
    case 'job':
      return const Icon(Icons.work, color: Color(0xFF2D6045), size: 30);
    case 'part-time':
      return const Icon(Icons.work, color: Color(0xFF2D6045), size: 30);
    case 'seasonal':
      return const Icon(Icons.work, color: Color(0xFF2D6045), size: 30);
    case 'uni':
      return const Icon(
        Icons.school,
        color: Color(0xFF4A6A8A), // Slate Blue
        size: 30,
      );
    case 'volunteer':
      return const Icon(
        Icons.volunteer_activism,
        color: Color(0xFFC57B57), // Rusty Orange
        size: 30,
      );
    case 'internship':
      return const Icon(Icons.work, color: Color(0xFF2D6045), size: 30);
    default:
      return const Icon(Icons.work, color: Color(0xFF2D6045), size: 30);
  }
}

// class for the expandable event tile
class ExpandableEventTile extends StatelessWidget {
  final MapEntry<String, List<CvEvent>> entry;

  const ExpandableEventTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final Map<String, GlobalKey> eventKeys = {};
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.key,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      exp.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (exp.highlights.isNotEmpty)
                    _bulletSection('Highlights:', exp.highlights),
                  if (exp.imageAssets.isNotEmpty)
                    _ImageCarousel(images: exp.imageAssets),
                  if (exp.links.isNotEmpty) _bulletSection("Links:", exp.links),
                  if (exp.references.isNotEmpty)
                    _bulletSection(
                      AppLocalizations.of(context)!.referenceRequest,
                      exp.references,
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _bulletSection(String title, List<String> items) {
    final isLinks = title == "Links:";
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ...items.map((item) {
            if (isLinks) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Linkify(
                    text: item,
                    style: TextStyle(fontSize: 16),
                    linkStyle: const TextStyle(color: Colors.blue),
                    onOpen: (link) async {
                      final uri = Uri.parse(link.url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontSize: 16)),
                Expanded(child: Text(item)),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ImageCarousel extends StatefulWidget {
  final List<String> images;

  const _ImageCarousel({required this.images});

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  late final PageController _controller;
  late final Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    if (widget.images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (_controller.hasClients) {
          _currentPage = (_currentPage + 1) % widget.images.length;
          _controller.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.images.length > 1) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              final image = widget.images[index];
              return GestureDetector(
                onTap: () => _showImageDialog(context, widget.images, index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.images.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index ? Colors.white : Colors.grey[600],
                  ),
                );
              }),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }

  void _showImageDialog(
    BuildContext context,
    List<String> images,
    int initialIndex,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        int currentIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.black87,
              insetPadding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image
                  InteractiveViewer(child: Image.asset(images[currentIndex])),

                  // Left arrow
                  if (images.length > 1)
                    Positioned(
                      left: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex =
                                (currentIndex - 1 + images.length) %
                                images.length;
                          });
                        },
                      ),
                    ),

                  // Right arrow
                  if (images.length > 1)
                    Positioned(
                      right: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = (currentIndex + 1) % images.length;
                          });
                        },
                      ),
                    ),

                  // Close button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}