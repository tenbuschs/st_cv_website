// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get greeting => 'Hi, I\'m Simon';

  @override
  String get profession => 'Precision Agriculture Engineer';

  @override
  String get loginDescription => 'Please log in to see my profile.';

  @override
  String get loginFailed => 'Login failed. Check username and password.';

  @override
  String get experience => 'Experience';

  @override
  String get education => 'Education';

  @override
  String get currentlyWorking => 'Current';
}
