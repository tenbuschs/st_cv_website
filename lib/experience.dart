import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';
import 'experience_list.dart' as exp_list;
import 'main_layout.dart';
import 'timeline.dart';

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
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _experienceKeys = {};

  // final List<exp_list.Experience> experiences = exp_list.experiences;

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
      silvers: [
        Timeline(
          groupedEvents:
              groupedExperiences, // Map<String, List<Experience>>Replace with your logic// Replace with your logic
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24)),

        // Map Footer
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51.0, 10.0),
                initialZoom: 5,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers:
                      exp_list.experiences.map((exp) {
                        return Marker(
                          point: LatLng(exp.latitude, exp.longitude),
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            // onTap: () => scrollToExperience(exp.id),
                            child: const Icon(
                              Icons.location_on,
                              color: Color(0xFF2D6045),
                              size: 30,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
