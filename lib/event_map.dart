import 'package:flutter/material.dart';
import 'event_lists.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'dart:math' as math;
import 'analytics.dart' as analytics;

class EventMap extends StatefulWidget {
  final List<CvEvent> events;

  const EventMap({super.key, required this.events});

  @override
  State<EventMap> createState() => _EventMapState();
}

class _EventMapState extends State<EventMap> {
  late final PopupController _popupController;
  late final MapController _mapController;
  final LatLng _initialCenter = LatLng(0, 0);
  final double _initialZoom = 1.0;
  double _currentZoom = 1.0;
  LatLng _currentCenter = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _popupController = PopupController();
    _mapController = MapController();
  }

  bool get _isCentered =>
      _currentCenter.latitude == _initialCenter.latitude &&
      _currentCenter.longitude == _initialCenter.longitude &&
      (_currentZoom - _initialZoom).abs() < 0.01;

  @override
  Widget build(BuildContext context) {
    final markers =
        widget.events.map((event) {
          return Marker(
            width: 40,
            height: 40,
            point: LatLng(event.latitude, event.longitude),
            child: Icon(
              Icons.location_on,
              size: 30,
              color: _categoryColour(event.category),
            ),
            key: ValueKey(event.id),
            alignment: Alignment.topCenter,
          );
        }).toList();

    return SliverToBoxAdapter(
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
                  onTap: (_, __){
                    analytics.logMapInteractions("whole_map", "tap_map");
                    _popupController.hideAllPopups();},
                  onPositionChanged: (pos, _) {
                    analytics.logMapInteractions("whole_map", "move_map");
                    setState(() {
                      _currentCenter = pos.center;
                      _currentZoom = pos.zoom;
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
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

                          final event = widget.events.firstWhere(
                            (e) =>
                                e.latitude == marker.point.latitude &&
                                e.longitude == marker.point.longitude,
                          );
                          analytics.logMapInteractions(event.title, "open_popup");
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(event.company),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      markerTapBehavior:
                          MarkerTapBehavior.togglePopupAndHideRest(),
                      popupController: _popupController,
                    ),
                  ),
                ],
              ),
              if (!_isCentered)
                Positioned(
                  top: 12,
                  right: 12,
                  child: FloatingActionButton(
                    mini: true,
                    tooltip: 'Center map',
                    child: Icon(Icons.my_location, size: 18),
                    onPressed: () {
                      analytics.logMapInteractions("center_button", "center_map");
                      _mapController.move(_initialCenter, _initialZoom);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _categoryColour(String category) {
  // This function returns different icons based on the category
  switch (category) {
    case 'job':
      return const Color(0xFF2D6045);
    case 'part-time':
      return const Color(0xFF2D6045);
    case 'seasonal':
      return const Color(0xFF2D6045);
    case 'uni':
      return const Color(0xFF4A6A8A); //Color(0xFF354F6B), // Slate Blue
    case 'volunteer':
      return const Color(0xFFC57B57); // Rusty Orange
    case 'internship':
      return const Color(0xFF2D6045);
    default:
      return const Color(0xFF2D6045);
  }
}
