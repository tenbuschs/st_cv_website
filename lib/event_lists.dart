import 'l10n/app_localizations.dart';
import 'package:flutter/material.dart';

List<CvEvent> getExperiences(BuildContext context) {
  return [
    CvEvent(
      id: 'sdc',
      title: AppLocalizations.of(context)!.sdcTitle,
      location: AppLocalizations.of(context)!.sdcLocation,
      latitude: -43.591933,
      longitude: 172.384283,
      company: AppLocalizations.of(context)!.sdcCompany,
      startDate: '2025-06-15',
      endDate: null,
      description: AppLocalizations.of(context)!.sdcDescription,
      category: 'part-time',
      imageAssets: [
      ],
      highlights: [
        AppLocalizations.of(context)!.sdcHighlight1,
        AppLocalizations.of(context)!.sdcHighlight2,
      ],
      links: [
        "https://www.selwyn.govt.nz/"
      ],
      references: [
        AppLocalizations.of(context)!.sdcReference
      ],
    ),
    CvEvent(
      id: 'ra',
      title: AppLocalizations.of(context)!.raTitle,
      location: AppLocalizations.of(context)!.locationLincoln,
      latitude: -43.645936,
      longitude: 172.464524,
      company: AppLocalizations.of(context)!.luName,
      startDate: '2025-01-15',
      endDate: null,
      description: AppLocalizations.of(context)!.raDescription,
      category: 'part-time',
      imageAssets: [
      ],
      highlights: [
        AppLocalizations.of(context)!.raHighlight1,
        AppLocalizations.of(context)!.raHighlight2,
        AppLocalizations.of(context)!.raHighlight3,
      ],
      links: [
        "https://www.lincoln.ac.nz/life-at-lincoln/accommodation/living-on-campus/"
      ],
      references: [
        AppLocalizations.of(context)!.raReference1,
        AppLocalizations.of(context)!.raReference2,
      ],
    ),
    CvEvent(
      id: 'msf_harvest',
      title: AppLocalizations.of(context)!.msfHarvestTitle,
      location: AppLocalizations.of(context)!.msfLocation,
      latitude: -32.767139,
      longitude: 119.449047,
      company: AppLocalizations.of(context)!.msfCompany,
      startDate: '2024-10-10',
      endDate: '2025-01-15',
      description: AppLocalizations.of(context)!.msfHarvestDescription,
      category: 'seasonal',
      imageAssets: [
        'assets/msf_harvest_01.jpg',
        'assets/msf_harvest_02.jpg',
        'assets/msf_harvest_03.jpg',
        'assets/msf_harvest_04.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.msfHarvestHighlight1,
        AppLocalizations.of(context)!.msfHarvestHighlight2,
        AppLocalizations.of(context)!.msfHarvestHighlight3,
        AppLocalizations.of(context)!.msfHarvestHighlight4,
      ],
      links: [],
      references: [
        AppLocalizations.of(context)!.msfReference1,
        AppLocalizations.of(context)!.msfReference2,
      ],
    ),
    CvEvent(
      id: 'msf_seeding',
      title: AppLocalizations.of(context)!.msfSeedingTitle,
      location: AppLocalizations.of(context)!.msfLocation,
      latitude: -32.767139,
      longitude: 119.449047,
      company: AppLocalizations.of(context)!.msfCompany,
      startDate: '2024-05-01',
      endDate: '2024-06-15',
      description: AppLocalizations.of(context)!.msfSeedingDescription,
      category: 'seasonal',
      imageAssets: [
        'assets/msf_seeding_01.jpg',
        'assets/msf_seeding_02.jpg',
        'assets/msf_seeding_03.jpg',
        'assets/msf_seeding_04.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.msfSeedingHighlight1,
        AppLocalizations.of(context)!.msfSeedingHighlight2,
        AppLocalizations.of(context)!.msfSeedingHighlight3,
      ],
      links: [],
      references: [
        AppLocalizations.of(context)!.msfReference1,
        AppLocalizations.of(context)!.msfReference2,
      ],
    ),
    CvEvent(
      id: 'dillon',
      title: AppLocalizations.of(context)!.dillonTitle,
      location: AppLocalizations.of(context)!.dillonLocation,
      latitude: -45.934391,
      longitude: 168.670269,
      company: AppLocalizations.of(context)!.dillonCompany,
      startDate: '2024-02-15',
      endDate: '2024-04-30',
      description: AppLocalizations.of(context)!.dillonDescription,
      category: 'seasonal',
      imageAssets: [
        'assets/dillon_01.jpg',
        'assets/dillon_02.jpg',
        'assets/dillon_03.jpg',
        'assets/dillon_04.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.dillonHighlight1,
        AppLocalizations.of(context)!.dillonHighlight2,
        AppLocalizations.of(context)!.dillonHighlight3,
      ],
      links: [],
      references: [
        AppLocalizations.of(context)!.dillonReference,
      ],
    ),
    CvEvent(
      id: 'latvia',
      title: AppLocalizations.of(context)!.latviaTitle,
      location: AppLocalizations.of(context)!.latviaLocation,
      latitude: 56.808549,
      longitude: 22.525651,
      company: AppLocalizations.of(context)!.latviaCompany,
      startDate: '2022-07-01',
      endDate: '2022-09-05',
      description: AppLocalizations.of(context)!.latviaDescription,
      category: 'seasonal',
      imageAssets: [
        'assets/latvia_01.jpg',
        'assets/latvia_02.jpg',
        'assets/latvia_03.jpg',
        'assets/latvia_04.jpg',
        'assets/latvia_05.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.latviaHighlight1,
        AppLocalizations.of(context)!.latviaHighlight2,
        AppLocalizations.of(context)!.latviaHighlight3,
      ],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'hiwi',
      title: AppLocalizations.of(context)!.hiwiTitle,
      location: AppLocalizations.of(context)!.locationOsna,
      latitude: 52.303393,
      longitude: 8.037987,
      company: AppLocalizations.of(context)!.hsosName,
      startDate: '2022-02-01',
      endDate: '2023-06-30',
      description: AppLocalizations.of(context)!.hiwiDescription,
      category: 'job',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.hiwiHighlight1,
        AppLocalizations.of(context)!.hiwiHighlight2,
        AppLocalizations.of(context)!.hiwiHighlight3,
        AppLocalizations.of(context)!.hiwiHighlight4,
      ],
      links: [
       // AppLocalizations.of(context)!.hiwiLink,
      ],
      references: [],
    ),
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
      category: 'job',
      imageAssets: [
        'assets/krone_01.jpg',
        'assets/krone_02.jpg',
        'assets/krone_03.jpg',
        'assets/krone_04.jpg',
        'assets/krone_05.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.kroneHighlight1,
        AppLocalizations.of(context)!.kroneHighlight2,
        AppLocalizations.of(context)!.kroneHighlight3,
        AppLocalizations.of(context)!.kroneHighlight4,
      ],
      links: [
        AppLocalizations.of(context)!.kroneLink,
      ],
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
      endDate: '2018-05-05',
      description: AppLocalizations.of(context)!.marshDescription,
      category: 'seasonal',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.marshHighlight1,
        AppLocalizations.of(context)!.marshHighlight2,
        AppLocalizations.of(context)!.marshHighlight3,
      ],
      links: [
        AppLocalizations.of(context)!.marshLink,
      ],
      references: [
        AppLocalizations.of(context)!.marshReference,
      ],
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
      category: 'seasonal',
      imageAssets: [
        'assets/schuetz_01.jpg'
      ],
      highlights: [
        AppLocalizations.of(context)!.schuetzHighlight1,
        AppLocalizations.of(context)!.schuetzHighlight2,
        AppLocalizations.of(context)!.schuetzHighlight3,
        AppLocalizations.of(context)!.schuetzHighlight4,
        AppLocalizations.of(context)!.schuetzHighlight5,
      ],
      links: [
        "https://www.landmaschinen-schuetz.de/de/lohnunternehmen" //doesn't work!!
      ],
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
      category: 'seasonal',
      imageAssets: ['assets/saudhof_01.jpg',
        'assets/saudhof_02.jpg'],
      highlights: [
        AppLocalizations.of(context)!.saudhofHighlight1,
        AppLocalizations.of(context)!.saudhofHighlight2,
        AppLocalizations.of(context)!.saudhofHighlight3,
        AppLocalizations.of(context)!.saudhofHighlight4,
      ],
      links: [
        "https://www.bauernhof-nelben.de/"
      ],
      references: [],
    ),
    CvEvent(
      id: 'dalhaus',
      title: AppLocalizations.of(context)!.dalhausTitle,
      location: AppLocalizations.of(context)!.locationDorsten,
      latitude: 51.628001,
      longitude: 6.996859,
      company: AppLocalizations.of(context)!.dalhausCompany,
      startDate: '2009-04-01',
      endDate: '2017-07-30',
      description: AppLocalizations.of(context)!.dalhausDescription,
      category: 'part-time',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.dalhausHighlight1,
        AppLocalizations.of(context)!.dalhausHighlight2,
        AppLocalizations.of(context)!.dalhausHighlight3,
        AppLocalizations.of(context)!.dalhausHighlight4,
      ],
      links: [
        AppLocalizations.of(context)!.dalhausLink,
      ],
      references: [
        AppLocalizations.of(context)!.dalhausReference1,
        AppLocalizations.of(context)!.dalhausReference2,
      ],
    ),
    CvEvent(
      id: 'suden',
      title: AppLocalizations.of(context)!.sudenTitle,
      location: AppLocalizations.of(context)!.locationDorsten,
      latitude: 51.658620,
      longitude: 7.011799,
      company: AppLocalizations.of(context)!.sudenCompany,
      startDate: '2014-09-01',
      endDate: '2014-09-15',
      description: AppLocalizations.of(context)!.sudenDescription,
      category: 'seasonal',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.sudenHighlight1,
        AppLocalizations.of(context)!.sudenHighlight2,
        AppLocalizations.of(context)!.sudenHighlight3,
      ],
      links: [
        AppLocalizations.of(context)!.sudenLink,
      ],
      references: [],
    ),
  ];
}

List<CvEvent> getEducations(BuildContext context) {
  return [
    CvEvent(
      id: 'master',
      title: AppLocalizations.of(context)!.masterTitle,
      location: AppLocalizations.of(context)!.locationLincoln,
      latitude: -43.643574,
      longitude: 172.467476,
      company:  AppLocalizations.of(context)!.luName,
      startDate: '2024-07-15',
      endDate: null,
      description: AppLocalizations.of(context)!.masterDescription,
      category: 'uni',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.masterHighlight1,
        AppLocalizations.of(context)!.masterHighlight2,
        AppLocalizations.of(context)!.masterHighlight3,
        AppLocalizations.of(context)!.masterHighlight4,
      ],
      links: [
        AppLocalizations.of(context)!.masterLink,
      ],
      references: [],
    ),
    CvEvent(
      id: 'bwa',
      title: AppLocalizations.of(context)!.bwaTitle,
      location: AppLocalizations.of(context)!.locationOsna,
      latitude: 52.303393,
      longitude: 8.037987,
      company: AppLocalizations.of(context)!.hsosName,
      startDate: '2021-09-01',
      endDate: '2024-01-29',
      description: AppLocalizations.of(context)!.bwaDescription,
      category: 'uni',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.bwaHighlight1,
        AppLocalizations.of(context)!.bwaHighlight2,
        AppLocalizations.of(context)!.bwaHighlight3,
        AppLocalizations.of(context)!.bwaHighlight4,
      ],
      links: [
        AppLocalizations.of(context)!.bwaLink,
      ],
      references: [],
    ),
    CvEvent(
      id: 'ets',
      title: AppLocalizations.of(context)!.etsTitle,
      location: AppLocalizations.of(context)!.locationLingen,
      latitude: 52.518639,
      longitude: 7.322342,
      company: AppLocalizations.of(context)!.hsosName,
      startDate: '2018-08-01',
      endDate: '2021-07-31',
      description: AppLocalizations.of(context)!.etsDescription,
      category: 'uni',
      imageAssets: [],
      highlights: [
        AppLocalizations.of(context)!.etsHighlight1,
        AppLocalizations.of(context)!.etsHighlight2,
        AppLocalizations.of(context)!.etsHighlight3,
        AppLocalizations.of(context)!.etsHighlight4,
      ],
      links: [
        AppLocalizations.of(context)!.etsLink,
      ],
      references: [],
    ),
    CvEvent(
      id: 'school',
      title: AppLocalizations.of(context)!.schoolTitle,
      location: AppLocalizations.of(context)!.locationGladbeck,
      latitude: 51.575931,
      longitude: 6.987037,
      company: AppLocalizations.of(context)!.schoolName,
      startDate: '2005-08-01',
      endDate: '2017-07-31',
      description: AppLocalizations.of(context)!.schoolDescription,
      category: 'uni',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),

  ];
}


List<CvEvent> getVolunteering(BuildContext context) {
  return [
    CvEvent(
      id: 'course_rep',
      title: AppLocalizations.of(context)!.courseRepTitle,
      location: AppLocalizations.of(context)!.locationLincoln,
      latitude: -43.644261,
      longitude: 172.469227,
      company: AppLocalizations.of(context)!.luName,
      startDate: '2025-02-18',
      endDate: null,
      description: AppLocalizations.of(context)!.courseRepDescription,
      category: 'volunteer',
      imageAssets: [],
      highlights: [],
      links: [
        'https://ltl.lincoln.ac.nz/teaching/evaluate-your-teaching/student-reps/'
      ],
      references: [],
    ),
    CvEvent(
      id: 'buddy',
      title: AppLocalizations.of(context)!.buddyTitle,
      location: AppLocalizations.of(context)!.locationLincoln,
      latitude: -43.643574,
      longitude: 172.467476,
      company: AppLocalizations.of(context)!.luName,
      startDate: '2024-10-01',
      endDate: null,
      description: AppLocalizations.of(context)!.buddyDescription,
      category: 'volunteer',
      imageAssets: [],
      highlights: [],
      links: [
        'https://www.lincoln.ac.nz/life-at-lincoln/starting-at-lincoln/kaiwhakarite-tauira-student-buddy-programme/'
      ],
      references: [
        AppLocalizations.of(context)!.buddyReference,
      ],
    ),
    CvEvent(
      id: 'faculty_council',
      title: AppLocalizations.of(context)!.facultyCouncilTitle,
      location: AppLocalizations.of(context)!.locationOsna,
      latitude: 52.303226,
      longitude: 8.039833,
      company: AppLocalizations.of(context)!.hsosName,
      startDate: '2022-01-01',
      endDate: '2022-12-31',
      description: AppLocalizations.of(context)!.facultyCouncilDescription,
      category: 'volunteer',
      imageAssets: [],
      highlights: [],
      links: [],
      references: [],
    ),
    CvEvent(
      id: 'thw',
      title: AppLocalizations.of(context)!.thwTitle,
      location: AppLocalizations.of(context)!.locationThw,
      latitude: 52.512489,
      longitude: 7.287195,
      company: AppLocalizations.of(context)!.thwCompany,
      startDate: '2020-08-01',
      endDate: '2024-01-31',
      description: AppLocalizations.of(context)!.thwDescription,
      category: 'volunteer',
      imageAssets: [
        'assets/thw_01.jpg',
        'assets/thw_02.jpg',
        'assets/thw_03.jpg',
        'assets/thw_04.jpg',
        'assets/thw_05.jpg',
      ],
      highlights: [
        AppLocalizations.of(context)!.thwHighlight1,
        AppLocalizations.of(context)!.thwHighlight2,
        AppLocalizations.of(context)!.thwHighlight3,
        AppLocalizations.of(context)!.thwHighlight4,
        AppLocalizations.of(context)!.thwHighlight5,
      ],
      links: [
        AppLocalizations.of(context)!.thwLink,
      ],
      references: [],
    ),
  ];
}


/*
Map<String, List<CvEvent>> groupByQuarter(List<CvEvent> exps) {
  final Map<String, List<CvEvent>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year} Q${((start.month - 1) ~/ 3) + 1}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}*/
/*
Map<String, List<CvEvent>> groupByYear(List<CvEvent> exps) {
  final Map<String, List<CvEvent>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}*/

Map<String, List<CvEvent>> groupByYear(List<CvEvent> exps) {
  final Map<String, List<CvEvent>> grouped = {};
  for (final exp in exps) {
    final year = exp.endDate != null
        ? DateTime.parse(exp.endDate!).year
        : DateTime.now().year;
    final key = '$year';
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
