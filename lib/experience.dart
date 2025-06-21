import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'event_lists.dart' ;
import 'main_layout.dart';
import 'timeline.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'dart:math' as math;

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
  final PopupController _popupController = PopupController();
  final MapController _mapController = MapController();
  final LatLng _initialCenter = LatLng(0,0);
  final double _initialZoom = 1.0;
  double _currentZoom = 1.0;
  LatLng _currentCenter = LatLng(0,0);

  bool get _isCentered =>
      _currentCenter.latitude == _initialCenter.latitude &&
          _currentCenter.longitude == _initialCenter.longitude &&
          (_currentZoom - _initialZoom).abs() < 0.01;

  @override
  Widget build(BuildContext context) {

    final experiences = getExperiences(context);
    final markers = experiences.map((exp) {
      return Marker(
        width: 40,
        height: 40,
        point: LatLng(exp.latitude, exp.longitude),
        child: Icon(Icons.location_on, size: 30, color: Color(0xFF2D6045)),
        key: ValueKey(exp.id), // Required for popups
        alignment: Alignment.topCenter, //tbd
      );
    }).toList();

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
          child: Center(
            child: SizedBox(
              width: math.min(MediaQuery.of(context).size.width * 0.9, 600),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: _initialCenter,
                      initialZoom: _initialZoom,
                      minZoom: 1,
                      onTap: (_, __) => _popupController.hideAllPopups(),
                      onPositionChanged: (pos, _) {
                        setState(() {
                          _currentCenter = pos.center ?? _currentCenter;
                          _currentZoom = pos.zoom ?? _currentZoom;
                        });
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                        tileBounds: LatLngBounds(
                          LatLng(-85, -180),
                          LatLng(85, 180),
                        ),
                      ),
                      PopupMarkerLayer(
                        options: PopupMarkerLayerOptions(
                          markers: markers,
                          popupDisplayOptions: PopupDisplayOptions(
                            builder: (BuildContext context, Marker marker) {
                              final exp = experiences.firstWhere(
                                      (e) => e.latitude == marker.point.latitude && e.longitude == marker.point.longitude);
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(exp.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(exp.company),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          markerTapBehavior: MarkerTapBehavior.togglePopupAndHideRest(),
                          popupController: _popupController,
                        ),
                      ),
                    ],
                  ),
                  // Button to center the map
                  if (!_isCentered)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: FloatingActionButton(
                        mini: true,
                        tooltip: 'Center map',
                        child: Icon(Icons.my_location, size: 18),
                        onPressed: () {
                          _mapController.move(_initialCenter, _initialZoom);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}
