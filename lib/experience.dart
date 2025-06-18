import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';
import 'experience_list.dart' as exp_list;
import 'main_layout.dart';

class ExperiencePage extends StatefulWidget {

  final VoidCallback toggleLocale;
  final Locale locale;

  const ExperiencePage({super.key, required this.toggleLocale, required this.locale});


  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {

  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _experienceKeys = {};

 // final List<exp_list.Experience> experiences = exp_list.experiences;


  Color _categoryColor(String category) {
    switch (category) {
      case 'Beruf':
        return const Color(0xFF2D6045);
      case 'Ehrenamt':
        return Colors.blueAccent;
      case 'Uni':
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }

  String formatPeriod(String startDate, String? endDate) {
    final start = DateFormat.yMMM('en').format(DateTime.parse(startDate));
    final end = endDate == null
        ? 'Today'
        : DateFormat.yMMM('en').format(DateTime.parse(endDate));
    return '$start – $end';
  }

  void scrollToExperience(String id) {
    final key = _experienceKeys[id];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupedExperiences = exp_list.groupByYear(exp_list.experiences);

    return MainLayout(
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      child:
      Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 72,
                backgroundImage: AssetImage('lib/assets/profile.jpg'),
                backgroundColor: const Color(0xFF2D6045),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Experience",
                            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ),
                       /* IconButton(
                          icon: Icon(Icons.language, color: Colors.grey[300]),
                          onPressed: toggleLocale,
                        ),*/
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Simon Tenbusch',
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          //Content
          Expanded(
            flex: 4,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: groupedExperiences.entries.map((entry) {
                final isLast = entry.key == groupedExperiences.keys.last;
                return Row(
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

                    // Expandable experience tiles
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
                            _experienceKeys[exp.id] = key;
                            return Container(
                              key: key,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: ExpansionTile(
                                collapsedBackgroundColor: Colors.grey[900],
                                backgroundColor: Colors.grey[850],
                                leading: Icon(Icons.work, color: _categoryColor(exp.category)),
                                title: Text(
                                  exp.title,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('${exp.location} • ${exp.company} • ${formatPeriod(exp.startDate, exp.endDate)}'),
                                // In ExpansionTile children (replace image block with slideshow after highlights)
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      exp.description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  if (exp.highlights.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Highlights:',
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          ...exp.highlights.map((h) => Row(
                                            children: [
                                              const Text('• ', style: TextStyle(fontSize: 16)),
                                              Expanded(child: Text(h)),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  if (exp.imageAssets.isNotEmpty)
                                    SizedBox(
                                      height: 160,
                                      child: PageView.builder(
                                        itemCount: exp.imageAssets.length,
                                        itemBuilder: (context, index) => Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Image.asset(exp.imageAssets[index]),
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
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51.0, 10.0),
                initialZoom: 5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: exp_list.experiences.map((exp) {
                    return Marker(
                      point: LatLng(exp.latitude, exp.longitude),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => scrollToExperience(exp.id),
                        child: const Icon(Icons.location_on, color: const Color(0xFF2D6045), size: 30),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


