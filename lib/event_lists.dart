import 'l10n/app_localizations.dart';
import 'package:flutter/material.dart';

List<CvEvent> getExperiences(BuildContext context) {
  return [
    CvEvent(
      id: 'krone',
      title: AppLocalizations.of(context)!.kroneTitle,
      location: AppLocalizations.of(context)!.kroneLocation,
      latitude: 52.356022,
      longitude: 7.472193,
      company: AppLocalizations.of(context)!.kroneCompany,
      startDate: '2018-08-01',
      endDate: '2024-01-31',
      description: AppLocalizations.of(context)!.kroneDescription,
      category: 'Beruf',
      imageAssets: [
        'lib/assets/krone_01.jpg',
        // Add more asset paths as needed
      ],
      highlights: [
        AppLocalizations.of(context)!.kroneHighlight1,
        AppLocalizations.of(context)!.kroneHighlight2,
        AppLocalizations.of(context)!.kroneHighlight3,
        AppLocalizations.of(context)!.kroneHighlight4,
      ],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'saudhof',
      title: AppLocalizations.of(context)!.saudhofTitle,
      location: AppLocalizations.of(context)!.saudhofLocation,
      latitude: 51.663973,
      longitude: 11.739965,
      company: AppLocalizations.of(context)!.saudhofCompany,
      startDate: '2016-07-01',
      endDate: '2016-08-31',
      description: AppLocalizations.of(context)!.saudhofDescription,
      category: 'Beruf',
      imageAssets: ['lib/assets/saudhof_01.jpg', 'lib/assets/saudhof_02.jpg'],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'marsh',
      title: AppLocalizations.of(context)!.marshTitle,
      location: AppLocalizations.of(context)!.marshLocation,
      latitude: -37.839512,
      longitude: 176.458520,
      company: AppLocalizations.of(context)!.marshCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.marshDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'schuetz',
      title: AppLocalizations.of(context)!.schuetzTitle,
      location: AppLocalizations.of(context)!.schuetzLocation,
      latitude: 51.930423,
      longitude: 11.804522,
      company: AppLocalizations.of(context)!.schuetzCompany,
      startDate: '2017-07-01',
      endDate: '2021-08-31',
      description: AppLocalizations.of(context)!.schuetzDescription,
      category: 'Beruf',
      imageAssets: ['lib/assets/schuetz_01.jpg'],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'msf',
      title: AppLocalizations.of(context)!.msfTitle,
      location: AppLocalizations.of(context)!.msfLocation,
      latitude: -32.767139,
      longitude: 119.449047,
      company: AppLocalizations.of(context)!.msfCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.msfDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'dillon',
      title: AppLocalizations.of(context)!.dillonTitle,
      location: AppLocalizations.of(context)!.dillonLocation,
      latitude: -45.934391,
      longitude: 168.670269,
      company: AppLocalizations.of(context)!.dillonCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.dillonDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'latvia',
      title: AppLocalizations.of(context)!.latviaTitle,
      location: AppLocalizations.of(context)!.latviaLocation,
      latitude: 56.808549,
      longitude: 22.525651,

      company: AppLocalizations.of(context)!.latviaCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.latviaDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'schuetz',
      title: AppLocalizations.of(context)!.schuetzTitle,
      location: AppLocalizations.of(context)!.schuetzLocation,
      latitude: 51.930423,
      longitude: 11.804522,
      company: AppLocalizations.of(context)!.schuetzCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.schuetzDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'dalhaus',
      title: AppLocalizations.of(context)!.dalhausTitle,
      location: AppLocalizations.of(context)!.dalhausLocation,
      latitude: 51.628001,
      longitude: 6.996859,
      company: AppLocalizations.of(context)!.dalhausCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.dalhausDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'suden',
      title: AppLocalizations.of(context)!.sudenTitle,
      location: AppLocalizations.of(context)!.sudenLocation,
      latitude: 51.658620,
      longitude: 7.011799,
      company: AppLocalizations.of(context)!.sudenCompany,
      startDate: '2018-02-01',
      endDate: '2018-04-30',
      description: AppLocalizations.of(context)!.sudenDescription,
      category: 'Beruf',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
  ];



}

List<CvEvent> getEducations(BuildContext context) {
  return [
    CvEvent(
      id: 'ets',
      title: AppLocalizations.of(context)!.etsTitle,
      location: AppLocalizations.of(context)!.etsLocation,
      latitude: 51.930423,
      //tbd
      longitude: 11.804522,
      //tbd
      company: 'University of Applied Sciences Osnabrück',
      startDate: '2018-08-01',
      endDate: '2021-07-31',
      //tbd
      description: 'tbd',
      category: 'Uni',
      imageAssets: [],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'bwa',
      title: AppLocalizations.of(context)!.bwaTitle,
      location: AppLocalizations.of(context)!.bwaLocation,
      latitude: 51.930423,   //tbd
      longitude: 11.804522,   //tbd
      company: 'University of Applied Sciences Osnabrück',
      startDate: '2021-09-01',
      endDate: '2024-01-29',
      //tbd
      description: 'tbd',
      category: 'Uni',
      imageAssets: [],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'lincoln',
      title: AppLocalizations.of(context)!.lincolnTitle,
      location: AppLocalizations.of(context)!.lincolnLocation,
      latitude: 51.930423,   //tbd
      longitude: 11.804522,   //tbd
      company:  AppLocalizations.of(context)!.lincolnCompany,
      startDate: '2021-09-01',
      endDate: '2024-01-29',      //tbd
      description: AppLocalizations.of(context)!.lincolnDescription,
      category: 'Uni',
      imageAssets: [],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
  ];
}


List<CvEvent> getVolunteering(BuildContext context) {
  return [
    CvEvent(
      id: 'thw_lingen',
      title: AppLocalizations.of(context)!.thwTitle,
      location: AppLocalizations.of(context)!.thwLocationLingen,
      latitude: 51.930423,     //tbd
      longitude: 11.804522,     //tbd
      company: AppLocalizations.of(context)!.thwCompany,
      startDate: '2021-09-01',
      //tbd
      endDate: '2024-01-29',
      //tbd
      description: AppLocalizations.of(context)!.thwDescription,
      category: 'Ehrenamt',
      imageAssets: [],
      highlights: ['tbd'],
      links: ['https://www.thw.de/EN/homepage/homepage_node.html'],
      references: [],
    ),
    CvEvent(
      id: 'thw_osna',
      title: AppLocalizations.of(context)!.thwTitle,
      location: AppLocalizations.of(context)!.thwLocationOsna,
      latitude: 51.930423,
      //tbd
      longitude: 11.804522,
      //tbd
      company: AppLocalizations.of(context)!.thwCompany,
      startDate: '2021-09-01',
      //tbd
      endDate: null,
      //tbd
      description: AppLocalizations.of(context)!.thwDescription,
      category: 'Ehrenamt',
      imageAssets: [],
      highlights: ['tbd'],
      links: ['https://www.thw.de/EN/homepage/homepage_node.html'],
      references: [],
    ),
    CvEvent(
      id: 'faculty_council',
      title: AppLocalizations.of(context)!.facultyCouncilTitle,
      location: AppLocalizations.of(context)!.facultyCouncilLocation,
      latitude: 51.930423,
      //tbd
      longitude: 11.804522,
      //tbd
      company: AppLocalizations.of(context)!.facultyCouncilCompany,
      startDate: '2022-01-01',
      //tbd
      endDate: '2023-12-31',
      //tbd
      description: AppLocalizations.of(context)!.facultyCouncilDescription,
      category: 'Ehrenamt',
      imageAssets: [],
      highlights: ['tbd'],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'buddy',
      title: AppLocalizations.of(context)!.buddyTitle,
      location: AppLocalizations.of(context)!.buddyLocation,
      latitude: 51.930423,
      //tbd
      longitude: 11.804522,
      //tbd
      company: AppLocalizations.of(context)!.buddyCompany,
      startDate: '2024-10-01',
      endDate: null,
      description: AppLocalizations.of(context)!.buddyDescription,
      category: 'Ehrenamt',
      imageAssets: [],
      highlights: ['tbd'],
      links: [
        'https://www.lincoln.ac.nz/life-at-lincoln/starting-at-lincoln/kaiwhakarite-tauira-student-buddy-programme/#:~:text=Student%20buddies%20are%20current%20students%20ready%20to%20help,guidance%20and%20help%20you%20to%20feel%20more%20comfortable.'
      ],
      references: [
        'Jayne Smith, Student Buddy Coordinator, Lincoln University'
      ],
    ),
    CvEvent(
      id: 'course_rep',
      title: AppLocalizations.of(context)!.courseRepTitle,
      location: AppLocalizations.of(context)!.courseRepLocation,
      latitude: 51.930423,
      //tbd
      longitude: 11.804522,
      //tbd
      company: AppLocalizations.of(context)!.courseRepLocation,
      startDate: '2025-02-18',
      //tbd
      endDate: null,
      //tbd
      description: AppLocalizations.of(context)!.courseRepDescription,
      category: 'Ehrenamt',
      imageAssets: [],
      highlights: ['tbd'],
      links: [
        'https://ltl.lincoln.ac.nz/teaching/evaluate-your-teaching/student-reps/'
      ],
      references: [],
    ),
  ];
}

Map<String, List<CvEvent>> groupByQuarter(List<CvEvent> exps) {
  final Map<String, List<CvEvent>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year} Q${((start.month - 1) ~/ 3) + 1}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}

Map<String, List<CvEvent>> groupByYear(List<CvEvent> exps) {
  final Map<String, List<CvEvent>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}

class CvEvent {
  final String id;
  final String title;
  final String location;
  final double latitude;
  final double longitude;
  final String company;
  final String startDate;
  final String? endDate;
  final String description;
  final String category;
  final List<String> imageAssets;
  final List<String> highlights;
  final List<String> links;
  final List<String> references;

  const CvEvent({
    required this.id,
    required this.title,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.category,
    required this.imageAssets,
    required this.highlights,
    required this.links,
    required this.references,
  });
}
