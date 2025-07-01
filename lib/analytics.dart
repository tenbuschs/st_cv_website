import 'package:firebase_analytics/firebase_analytics.dart';


// Logs the view duration of a page
Future<void> logPageViewDuration(String page, DateTime startTime) async {
  final duration = DateTime.now().difference(startTime).inSeconds;
  await FirebaseAnalytics.instance.logEvent(
    name: 'page_view_duration',
    parameters: {'page': page, 'duration_seconds': duration},
  );
}

// Logs a page view initialisation
Future<void> logPageView(String page) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'page_view',
    parameters: {'page': page},
  );
}

// Logs a navigation tile usage of home page
Future<void> logNavTileUsed(String target) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'home_nav_tile_used',
    parameters: {'page': target},
  );
}

// Logs a usage of contact buttons
Future<void> logContactButtonUsed(String button) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'contact_area_button_used',
    parameters: {'button': button},
  );
}


// logs a usage of navbar buttons
Future<void> logNavButtonUsed(String button) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'navbar_button_used',
    parameters: {'button': button},
  );
}

// Logs view project in portfolio
Future<void> logPortfolioViewProject(String projectName) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'portfolio_view_project',
    parameters: {'project_name': projectName},
  );
}

// Log Event Tile Expansion
Future<void> logEventTileExpanded(String eventName) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'event_tile_expanded',
    parameters: {'event_name': eventName},
  );
}


// Log map interactions
Future<void> logMapInteractions(String elementName, String interactionType) async {
  FirebaseAnalytics.instance.logEvent(
    name: 'map_interaction',
    parameters: {
      "element_name": elementName,
      'interaction_type': interactionType
    },
  );
}