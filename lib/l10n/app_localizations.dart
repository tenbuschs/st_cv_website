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

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'I am passionate about arable farming and agricultural technology, especially everything that could be summarised under Precision Farming and Smart Farming. Enjoy exploring my website!'**
  String get aboutMe;

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

  /// No description provided for @referenceRequest.
  ///
  /// In en, this message translates to:
  /// **'Reference (contact information on request):'**
  String get referenceRequest;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'years'**
  String get years;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'months'**
  String get months;

  /// No description provided for @sdcTitle.
  ///
  /// In en, this message translates to:
  /// **'Event and Facilities Support'**
  String get sdcTitle;

  /// No description provided for @sdcCompany.
  ///
  /// In en, this message translates to:
  /// **'Selwyn District Council'**
  String get sdcCompany;

  /// No description provided for @sdcLocation.
  ///
  /// In en, this message translates to:
  /// **'Rolleston, New Zealand'**
  String get sdcLocation;

  /// No description provided for @sdcDescription.
  ///
  /// In en, this message translates to:
  /// **'Casual job to assist in the organisation and running of local community events and facilities. The core activities are operations (set-up and pack-down, material transport) and customer support (greeting, serving, handling all enquiries).'**
  String get sdcDescription;

  /// No description provided for @sdcHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Experience in dealing with a wide variety of people'**
  String get sdcHighlight1;

  /// No description provided for @sdcHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Insights into the realisation of large events'**
  String get sdcHighlight2;

  /// No description provided for @sdcReference.
  ///
  /// In en, this message translates to:
  /// **'Maria Flower, Senior Advisor Community Events (and Funding)'**
  String get sdcReference;

  /// No description provided for @raTitle.
  ///
  /// In en, this message translates to:
  /// **'Residential Assistant'**
  String get raTitle;

  /// No description provided for @raDescription.
  ///
  /// In en, this message translates to:
  /// **'First point of contact for students in halls of residence. Support with the organisation of events and activities. Promoting a positive living atmosphere. Ensuring compliance with student well-being guidelines.'**
  String get raDescription;

  /// No description provided for @raHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Expansion of my competences in the area of pastoral care and stress management'**
  String get raHighlight1;

  /// No description provided for @raHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Digitalisation and improvement of processes through my new spreadsheet'**
  String get raHighlight2;

  /// No description provided for @raHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Confrontation with extreme emotional situations'**
  String get raHighlight3;

  /// No description provided for @raReference1.
  ///
  /// In en, this message translates to:
  /// **'Belinda Hawley, Accommodation Manager'**
  String get raReference1;

  /// No description provided for @raReference2.
  ///
  /// In en, this message translates to:
  /// **'Rachel Close, Operations Lead'**
  String get raReference2;

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

  /// No description provided for @msfReference1.
  ///
  /// In en, this message translates to:
  /// **'Allan Sutherland, Senior Farm Owner and Manager'**
  String get msfReference1;

  /// No description provided for @msfReference2.
  ///
  /// In en, this message translates to:
  /// **'Ace Sutherland, Junior Farm Manager'**
  String get msfReference2;

  /// No description provided for @msfHarvestTitle.
  ///
  /// In en, this message translates to:
  /// **'Chaser Bin Driver'**
  String get msfHarvestTitle;

  /// No description provided for @msfHarvestDescription.
  ///
  /// In en, this message translates to:
  /// **'Work as a chaser bin driver, mainly with JCB 8330 and NYREX Titan II. Including all maintenance and care of the vehicles. \nThe farm cultivates around 14,500 hectares of arable land with Controlled Traffic Farming and no-till farming. The main crops grown are wheat, barley, rapeseed and lupins.'**
  String get msfHarvestDescription;

  /// No description provided for @msfHarvestHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Insights into large-scale harvest logistics'**
  String get msfHarvestHighlight1;

  /// No description provided for @msfHarvestHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Management responsibility for other chaser bin drivers'**
  String get msfHarvestHighlight2;

  /// No description provided for @msfHarvestHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Improved utilisation of the guidance system for chaser bins'**
  String get msfHarvestHighlight3;

  /// No description provided for @msfHarvestHighlight4.
  ///
  /// In en, this message translates to:
  /// **'Fighting wildfires and bushfires'**
  String get msfHarvestHighlight4;

  /// No description provided for @msfSeedingTitle.
  ///
  /// In en, this message translates to:
  /// **'Air Seeder Operator'**
  String get msfSeedingTitle;

  /// No description provided for @msfSeedingDescription.
  ///
  /// In en, this message translates to:
  /// **'Seeding of grain and rapeseed using an 18-metre pneumatic direct seeder and John Deere 9560 R. Including all maintenance and repair work as well as seed and fertiliser logistics. \nThe farm cultivates around 14,500 hectares of arable land with Controlled Traffic Farming and no-till farming. The main crops grown are wheat, barley, rapeseed and lupins.'**
  String get msfSeedingDescription;

  /// No description provided for @msfSeedingHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Impressions of water- and resource-saving cultivation through direct sowing'**
  String get msfSeedingHighlight1;

  /// No description provided for @msfSeedingHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Optimisation of work quality through more precise calibration'**
  String get msfSeedingHighlight2;

  /// No description provided for @msfSeedingHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Using a shared coverage map in Green Star'**
  String get msfSeedingHighlight3;

  /// No description provided for @dillonTitle.
  ///
  /// In en, this message translates to:
  /// **'Farm Hand'**
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
  /// **'Carrying out all tasks on the farm. Mainly driving tractors (harvest logistics, soil cultivation, sowing), but also maintenance and servicing work, grain storage, and activities in livestock farming. \nThe farm manages almost 1000 ha with mainly arable farming (wheat, barley, triticale, rape) and some lamb and beef finishing. A large focus is on the milling and mixing of grain and delivery to neighbouring livestock farmers.'**
  String get dillonDescription;

  /// No description provided for @dillonReference.
  ///
  /// In en, this message translates to:
  /// **'Kenny Jackson, 2nd in Charge'**
  String get dillonReference;

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
  /// **'10-week summer job for harvesting and seeding on a German-speaking farm. Supporting the harvest logistics in an agri -truck, spreading slug pellets, spreading fertiliser, soil cultivation using a disc harrow and cultivator. \nThe arable farm cultivates around 5000 ha (wheat, barley and rapeseed). The farm also has large storage capacities and its own seed processing facility.'**
  String get latviaDescription;

  /// No description provided for @latviaHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Narrow time window for harvesting and sowing due to northern latitude'**
  String get latviaHighlight1;

  /// No description provided for @latviaHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Setup of section control for fertiliser spreader'**
  String get latviaHighlight2;

  /// No description provided for @latviaHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Completely independent fertiliser application on almost 4000 ha (incl. calibrations, fertiliser logistics, field planning)'**
  String get latviaHighlight3;

  /// No description provided for @kroneTitle.
  ///
  /// In en, this message translates to:
  /// **'Mechatronics Engineer in R&D Electronics'**
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

  /// No description provided for @kroneLink.
  ///
  /// In en, this message translates to:
  /// **'Company Website: https://www.krone-agriculture.com/en/'**
  String get kroneLink;

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
  /// **'Driving for the contracting company in the autumn season and helping with all tasks. The company specialises in grassland and maize harvesting. In this context, my work focused on mowing, raking, baling and wrapping, but I also carried out reseeding and transport.'**
  String get marshDescription;

  /// No description provided for @marshHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Mowing with butterfly mower'**
  String get marshHighlight1;

  /// No description provided for @marshHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Gathering experience in steep terrain'**
  String get marshHighlight2;

  /// No description provided for @marshHighlight3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get marshHighlight3;

  /// No description provided for @marshHighlight4.
  ///
  /// In en, this message translates to:
  /// **''**
  String get marshHighlight4;

  /// No description provided for @marshReference.
  ///
  /// In en, this message translates to:
  /// **'Tammy Marsh, Owner and Manager'**
  String get marshReference;

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
  /// **'Operating combines and other agricultural'**
  String get schuetzDescription;

  /// No description provided for @schuetzHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Operating Claas Lexion combines in various conditions'**
  String get schuetzHighlight1;

  /// No description provided for @schuetzHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Intense maintenance and repair of agricultural machinery'**
  String get schuetzHighlight2;

  /// No description provided for @schuetzHighlight3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get schuetzHighlight3;

  /// No description provided for @schuetzHighlight4.
  ///
  /// In en, this message translates to:
  /// **''**
  String get schuetzHighlight4;

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
  /// **''**
  String get saudhofDescription;

  /// No description provided for @saudhofHighlight1.
  ///
  /// In en, this message translates to:
  /// **''**
  String get saudhofHighlight1;

  /// No description provided for @saudhofHighlight2.
  ///
  /// In en, this message translates to:
  /// **''**
  String get saudhofHighlight2;

  /// No description provided for @saudhofHighlight3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get saudhofHighlight3;

  /// No description provided for @saudhofHighlight4.
  ///
  /// In en, this message translates to:
  /// **''**
  String get saudhofHighlight4;

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

  /// No description provided for @dalhausDescription.
  ///
  /// In en, this message translates to:
  /// **'Assisting in various farm operations, gaining practical experience in agricultural practices.'**
  String get dalhausDescription;

  /// No description provided for @dalhausHighlight1.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausHighlight1;

  /// No description provided for @dalhausHighlight2.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausHighlight2;

  /// No description provided for @dalhausHighlight3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausHighlight3;

  /// No description provided for @dalhausHighlight4.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausHighlight4;

  /// No description provided for @dalhausReference1.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausReference1;

  /// No description provided for @dalhausReference2.
  ///
  /// In en, this message translates to:
  /// **'Tobias Dalhaus, Farmer'**
  String get dalhausReference2;

  /// No description provided for @dalhausLink.
  ///
  /// In en, this message translates to:
  /// **''**
  String get dalhausLink;

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

  /// No description provided for @sudenDescription.
  ///
  /// In en, this message translates to:
  /// **'Internship focusing on the maintenance and repair of agricultural and construction machinery, gaining hands-on experience in mechanical engineering.'**
  String get sudenDescription;

  /// No description provided for @sudenHighlight1.
  ///
  /// In en, this message translates to:
  /// **''**
  String get sudenHighlight1;

  /// No description provided for @sudenHighlight2.
  ///
  /// In en, this message translates to:
  /// **''**
  String get sudenHighlight2;

  /// No description provided for @sudenHighlight3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get sudenHighlight3;

  /// No description provided for @etsTitle.
  ///
  /// In en, this message translates to:
  /// **'B.Eng. Engineering of Technical Systems (Mechatronics)'**
  String get etsTitle;

  /// No description provided for @etsDescription.
  ///
  /// In en, this message translates to:
  /// **'Dual Studies'**
  String get etsDescription;

  /// No description provided for @bwaTitle.
  ///
  /// In en, this message translates to:
  /// **'B.Eng. Agri-Food Engineering and Business'**
  String get bwaTitle;

  /// No description provided for @bwaDescription.
  ///
  /// In en, this message translates to:
  /// **'Bla bla bla'**
  String get bwaDescription;

  /// No description provided for @masterTitle.
  ///
  /// In en, this message translates to:
  /// **'M.Sc.Precision Agriculture'**
  String get masterTitle;

  /// No description provided for @masterDescription.
  ///
  /// In en, this message translates to:
  /// **'Master\'s program focusing on precision agriculture technologies and practices.'**
  String get masterDescription;

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

  /// No description provided for @buddyDescription.
  ///
  /// In en, this message translates to:
  /// **'Assisting new students in their transition to university life, providing guidance and support.'**
  String get buddyDescription;

  /// No description provided for @buddyReference.
  ///
  /// In en, this message translates to:
  /// **'Jayne Smith, Student Buddy Coordinator'**
  String get buddyReference;

  /// No description provided for @courseRepTitle.
  ///
  /// In en, this message translates to:
  /// **'Course Representative'**
  String get courseRepTitle;

  /// No description provided for @courseRepDescription.
  ///
  /// In en, this message translates to:
  /// **'Acting as a liaison between students and faculty, gathering feedback and representing student concerns in course-related matters.'**
  String get courseRepDescription;

  /// No description provided for @locationDorsten.
  ///
  /// In en, this message translates to:
  /// **'Dorsten, Germany'**
  String get locationDorsten;

  /// No description provided for @locationLingen.
  ///
  /// In en, this message translates to:
  /// **'Lingen (Ems), Germany'**
  String get locationLingen;

  /// No description provided for @locationOsna.
  ///
  /// In en, this message translates to:
  /// **'Osnabrück, Germany'**
  String get locationOsna;

  /// No description provided for @locationLincoln.
  ///
  /// In en, this message translates to:
  /// **'Lincoln, New Zealand'**
  String get locationLincoln;

  /// No description provided for @locationGladbeck.
  ///
  /// In en, this message translates to:
  /// **'Gladbeck, Germany'**
  String get locationGladbeck;

  /// No description provided for @luName.
  ///
  /// In en, this message translates to:
  /// **'Lincoln University'**
  String get luName;

  /// No description provided for @hsosName.
  ///
  /// In en, this message translates to:
  /// **'University of Applied Sciences Osnabrück'**
  String get hsosName;

  /// No description provided for @schoolTitle.
  ///
  /// In en, this message translates to:
  /// **'School Education up to General Higher Qualification for University Entrance'**
  String get schoolTitle;

  /// No description provided for @schoolName.
  ///
  /// In en, this message translates to:
  /// **'Hermannschule (Primary School) and Ratsgymnasium (High School)'**
  String get schoolName;

  /// No description provided for @schoolDescription.
  ///
  /// In en, this message translates to:
  /// **' G12 blabla '**
  String get schoolDescription;
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
