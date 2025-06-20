import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m Simon'**
  String get greeting;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Precision Agriculture Engineer'**
  String get profession;

  /// No description provided for @loginDescription.
  ///
  /// In en, this message translates to:
  /// **'Please log in to see my profile.'**
  String get loginDescription;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Check username and password.'**
  String get loginFailed;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @volunteering.
  ///
  /// In en, this message translates to:
  /// **'Side Quests & Certificates'**
  String get volunteering;

  /// No description provided for @currentlyWorking.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get currentlyWorking;

  /// No description provided for @kroneTitle.
  ///
  /// In en, this message translates to:
  /// **'Engineer in R&D Electronics'**
  String get kroneTitle;

  /// No description provided for @kroneCompany.
  ///
  /// In en, this message translates to:
  /// **'KRONE Agriculture SE'**
  String get kroneCompany;

  /// No description provided for @kroneLocation.
  ///
  /// In en, this message translates to:
  /// **'Spelle, Germany'**
  String get kroneLocation;

  /// No description provided for @kroneDescription.
  ///
  /// In en, this message translates to:
  /// **'Dual Studies and Working Student in the R&D Electronics department with focus on software development.'**
  String get kroneDescription;

  /// No description provided for @kroneHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Development of a joystick steering system for the BiG X forage harvester'**
  String get kroneHighlight1;

  /// No description provided for @kroneHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Further development of the AutoFill overloading automation on the BiG X'**
  String get kroneHighlight2;

  /// No description provided for @kroneHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Development of a new ISOBUS user interface'**
  String get kroneHighlight3;

  /// No description provided for @kroneHighlight4.
  ///
  /// In en, this message translates to:
  /// **'Working on confidential pre-development projects'**
  String get kroneHighlight4;

  /// No description provided for @etsTitle.
  ///
  /// In en, this message translates to:
  /// **'Engineer of Technical Systems, Specialization Mechatronics'**
  String get etsTitle;

  /// No description provided for @etsCompany.
  ///
  /// In en, this message translates to:
  /// **'University of Applied Sciences Osnabrück'**
  String get etsCompany;

  /// No description provided for @etsLocation.
  ///
  /// In en, this message translates to:
  /// **'Lingen (Ems), Germany'**
  String get etsLocation;

  /// No description provided for @etsDescription.
  ///
  /// In en, this message translates to:
  /// **'Dual Studies'**
  String get etsDescription;

  /// No description provided for @bwaTitle.
  ///
  /// In en, this message translates to:
  /// **'Agri-Food Engineering and Business'**
  String get bwaTitle;

  /// No description provided for @bwaCompany.
  ///
  /// In en, this message translates to:
  /// **'University of Applied Sciences Osnabrück'**
  String get bwaCompany;

  /// No description provided for @bwaLocation.
  ///
  /// In en, this message translates to:
  /// **'Osnabrück, Germany'**
  String get bwaLocation;

  /// No description provided for @bwaDescription.
  ///
  /// In en, this message translates to:
  /// **'Bla bla bla'**
  String get bwaDescription;

  /// No description provided for @lincolnTitle.
  ///
  /// In en, this message translates to:
  /// **'Master in Precision Agriculture (M.Sc.)'**
  String get lincolnTitle;

  /// No description provided for @lincolnCompany.
  ///
  /// In en, this message translates to:
  /// **'Lincoln University'**
  String get lincolnCompany;

  /// No description provided for @lincolnLocation.
  ///
  /// In en, this message translates to:
  /// **'Lincoln, New Zealand'**
  String get lincolnLocation;

  /// No description provided for @lincolnDescription.
  ///
  /// In en, this message translates to:
  /// **'Master\'s program focusing on precision agriculture technologies and practices.'**
  String get lincolnDescription;

  /// No description provided for @thwTitle.
  ///
  /// In en, this message translates to:
  /// **'Volunteer at German Federal Agency for Technical Relief'**
  String get thwTitle;

  /// No description provided for @thwCompany.
  ///
  /// In en, this message translates to:
  /// **'German Federal Agency for Technical Relief'**
  String get thwCompany;

  /// No description provided for @thwLocationLingen.
  ///
  /// In en, this message translates to:
  /// **'Lingen (Ems), Germany'**
  String get thwLocationLingen;

  /// No description provided for @thwLocationOsna.
  ///
  /// In en, this message translates to:
  /// **'Osnabrück, Germany'**
  String get thwLocationOsna;

  /// No description provided for @thwDescription.
  ///
  /// In en, this message translates to:
  /// **'Volunteer work with the German Federal Agency for Technical Relief, providing assistance in various emergency situations.'**
  String get thwDescription;

  /// No description provided for @facultyCouncilTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Representative in Faculty Council'**
  String get facultyCouncilTitle;

  /// No description provided for @facultyCouncilCompany.
  ///
  /// In en, this message translates to:
  /// **'University of Applied Sciences Osnabrück'**
  String get facultyCouncilCompany;

  /// No description provided for @facultyCouncilLocation.
  ///
  /// In en, this message translates to:
  /// **'Osnabrück, Germany'**
  String get facultyCouncilLocation;

  /// No description provided for @facultyCouncilDescription.
  ///
  /// In en, this message translates to:
  /// **'Representing student interests in the faculty council, participating in decision-making processes regarding academic policies and programs.'**
  String get facultyCouncilDescription;

  /// No description provided for @buddyTitle.
  ///
  /// In en, this message translates to:
  /// **'Student Buddy'**
  String get buddyTitle;

  /// No description provided for @buddyCompany.
  ///
  /// In en, this message translates to:
  /// **'Lincoln University'**
  String get buddyCompany;

  /// No description provided for @buddyLocation.
  ///
  /// In en, this message translates to:
  /// **'Lincoln, New Zealand'**
  String get buddyLocation;

  /// No description provided for @buddyDescription.
  ///
  /// In en, this message translates to:
  /// **'Assisting new students in their transition to university life, providing guidance and support.'**
  String get buddyDescription;

  /// No description provided for @courseRepTitle.
  ///
  /// In en, this message translates to:
  /// **'Course Representative'**
  String get courseRepTitle;

  /// No description provided for @courseRepCompany.
  ///
  /// In en, this message translates to:
  /// **'Lincoln University'**
  String get courseRepCompany;

  /// No description provided for @courseRepLocation.
  ///
  /// In en, this message translates to:
  /// **'Lincoln, New Zealand'**
  String get courseRepLocation;

  /// No description provided for @courseRepDescription.
  ///
  /// In en, this message translates to:
  /// **'Acting as a liaison between students and faculty, gathering feedback and representing student concerns in course-related matters.'**
  String get courseRepDescription;

  /// No description provided for @saudhofTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get saudhofTitle;

  /// No description provided for @saudhofCompany.
  ///
  /// In en, this message translates to:
  /// **'Matthias Saudhof'**
  String get saudhofCompany;

  /// No description provided for @saudhofLocation.
  ///
  /// In en, this message translates to:
  /// **'Nelben, Germany'**
  String get saudhofLocation;

  /// No description provided for @saudhofDescription.
  ///
  /// In en, this message translates to:
  /// **'Assisting in agricultural operations as a machinery operator, focusing on practical applications of agricultural engineering.'**
  String get saudhofDescription;

  /// No description provided for @marshTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get marshTitle;

  /// No description provided for @marshCompany.
  ///
  /// In en, this message translates to:
  /// **'Marsh Contracting Ltd.'**
  String get marshCompany;

  /// No description provided for @marshLocation.
  ///
  /// In en, this message translates to:
  /// **'Te Puke, New Zealand'**
  String get marshLocation;

  /// No description provided for @marshDescription.
  ///
  /// In en, this message translates to:
  /// **'Working as a machinery operator in New Zealand, gaining international experience in agricultural practices.'**
  String get marshDescription;

  /// No description provided for @schuetzTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get schuetzTitle;

  /// No description provided for @schuetzCompany.
  ///
  /// In en, this message translates to:
  /// **'Schütz Landmaschinen OHG'**
  String get schuetzCompany;

  /// No description provided for @schuetzLocation.
  ///
  /// In en, this message translates to:
  /// **'Calbe (Saale), Germany'**
  String get schuetzLocation;

  /// No description provided for @schuetzDescription.
  ///
  /// In en, this message translates to:
  /// **'Operating agricultural machinery, contributing to various farming operations and gaining hands-on experience in the field.'**
  String get schuetzDescription;

  /// No description provided for @dillonTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get dillonTitle;

  /// No description provided for @dillonCompany.
  ///
  /// In en, this message translates to:
  /// **'Dillon Harvesting Ltd.'**
  String get dillonCompany;

  /// No description provided for @dillonLocation.
  ///
  /// In en, this message translates to:
  /// **'Riversdale, New Zealand'**
  String get dillonLocation;

  /// No description provided for @dillonDescription.
  ///
  /// In en, this message translates to:
  /// **'Working as a machinery operator in New Zealand, focusing on practical applications of precision agriculture technologies.'**
  String get dillonDescription;

  /// No description provided for @msfTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get msfTitle;

  /// No description provided for @msfCompany.
  ///
  /// In en, this message translates to:
  /// **'Mount Sheridan Farms'**
  String get msfCompany;

  /// No description provided for @msfLocation.
  ///
  /// In en, this message translates to:
  /// **'Varley, WA, Australia'**
  String get msfLocation;

  /// No description provided for @msfDescription.
  ///
  /// In en, this message translates to:
  /// **'Operating agricultural machinery in Australia, gaining experience in large-scale farming operations.'**
  String get msfDescription;

  /// No description provided for @latviaTitle.
  ///
  /// In en, this message translates to:
  /// **'Machinery Operator'**
  String get latviaTitle;

  /// No description provided for @latviaCompany.
  ///
  /// In en, this message translates to:
  /// **'SIA Rapsulauks'**
  String get latviaCompany;

  /// No description provided for @latviaLocation.
  ///
  /// In en, this message translates to:
  /// **'Satiki, Latvia'**
  String get latviaLocation;

  /// No description provided for @latviaDescription.
  ///
  /// In en, this message translates to:
  /// **'Working as a machinery operator in Latvia, focusing on practical applications of precision agriculture technologies.'**
  String get latviaDescription;

  /// No description provided for @dalhausTitle.
  ///
  /// In en, this message translates to:
  /// **'Farm Hand'**
  String get dalhausTitle;

  /// No description provided for @dalhausCompany.
  ///
  /// In en, this message translates to:
  /// **'Ludger Dalhaus'**
  String get dalhausCompany;

  /// No description provided for @dalhausLocation.
  ///
  /// In en, this message translates to:
  /// **'Dorsten, Germany'**
  String get dalhausLocation;

  /// No description provided for @dalhausDescription.
  ///
  /// In en, this message translates to:
  /// **'Assisting in various farm operations, gaining practical experience in agricultural practices.'**
  String get dalhausDescription;

  /// No description provided for @sudenTitle.
  ///
  /// In en, this message translates to:
  /// **'Internship as an Agricultural and Construction Machinery Mechanic '**
  String get sudenTitle;

  /// No description provided for @sudenCompany.
  ///
  /// In en, this message translates to:
  /// **'Suden Baumaschinen GmbH'**
  String get sudenCompany;

  /// No description provided for @sudenLocation.
  ///
  /// In en, this message translates to:
  /// **'Dorsten, Germany'**
  String get sudenLocation;

  /// No description provided for @sudenDescription.
  ///
  /// In en, this message translates to:
  /// **'Internship focusing on the maintenance and repair of agricultural and construction machinery, gaining hands-on experience in mechanical engineering.'**
  String get sudenDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
