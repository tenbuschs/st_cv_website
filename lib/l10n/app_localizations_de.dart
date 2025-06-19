// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get greeting => 'Moin, ich bin Simon';

  @override
  String get profession => 'Softwareentwickler';

  @override
  String get loginDescription => 'Bitte melden Sie sich an, um mein Profil zu sehen.';

  @override
  String get loginFailed => 'Login fehlgeschlagen. Bitte versuchen Sie es erneut.';
}
