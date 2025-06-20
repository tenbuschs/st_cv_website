import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'event_lists.dart' ;
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

  @override
  Widget build(BuildContext context) {

    return MainLayout(
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      silvers: [
        Timeline(
          groupedEvents:
          groupByYear(getExperiences(context)),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24)),

        // Map Footer
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(0, 0), // Center on the world
                initialZoom: 1.5,            // Zoomed out to show most of the world
                 ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: getExperiences(context).map((exp) {
                    return Marker(
                      point: LatLng(exp.latitude, exp.longitude),
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.location_on,
                        color: Color(0xFF2D6045),
                        size: 30,
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
