
final List<Experience> experiences = const [
  Experience(
    id: 'krone',
    title: 'Engineer in R&D Electronics',
    location: 'Spelle, Germany',
    latitude: 52.356022,
    longitude: 7.472193,
    company: 'KRONE Agriculture SE',
    startDate: '2018-08-01',
    endDate: '2024-01-31',
    description: 'Dual Studies and Working Student in the R&D Electronics department with focus on software development.',
    category: 'Beruf',
    imageAssets: [
      'lib/assets/krone_01.jpg',
      // Add more asset paths as needed
    ],
    highlights: [
      'Entwicklung einer Joysticklenkung für den Feldhäcksler BiG X',
      'Weiterentwicklung der Überladeautomatik AutoFill am BiG X',
      'Mitentwicklung eines neuen ISOBUS User Interface',
      'Mitwirken bei vertraulichen Vorentwicklungsprojekten',
    ],
    links: [],
    references: [],
  ),
  Experience(
    id: 'thw',
    title: 'Volunteer',
    location: 'Lingen, Germany',
    latitude: 52.512458,
    longitude: 7.286907,
    company: 'German Federal Agency for Technical Relief',
    startDate: '2020-01-01',
    endDate: null,
    description: 'tbd',
    category: 'Ehrenamt',
    imageAssets: [],
    highlights: [
      'tbd',
    ],
    links: [],
    references: [],
  ),
  Experience(
    id: 'saudhof',
    title: 'Machinery Operator',
    location: 'Nelben, Germany',
    latitude: 51.663973,
    longitude: 11.739965,
    company: 'Matthias Saudhof',
    startDate: '2016-07-01',
    endDate: '2016-08-31',
    description: 'tbd',
    category: 'Beruf',
    imageAssets: [
      'lib/assets/saudhof_01.jpg',
      'lib/assets/saudhof_02.jpg',
    ],
    highlights: [
      'tbd',
    ],
    links: [],
    references: [],
  ),
  Experience(
    id: 'marsh',
    title: 'Machinery Operator',
    location: 'Te Puke, New Zealand',
    latitude: -37.839512,
    longitude: 176.458520,
    company: 'Marsh Contracting Ltd.',
    startDate: '2018-02-01',
    endDate: '2018-04-30',
    description: 'tbd',
    category: 'Beruf',
    imageAssets: [],
    highlights: [
      'tbd',
    ],
    links: [],
    references: [],
  ),
  Experience(
    id: 'schuetz',
    title: 'Machinery Operator',
    location: 'Calbe (Saale), Germany',
    latitude: 51.930423,
    longitude: 11.804522,
    company: 'Schütz Landmaschinen OHG',
    startDate: '2017-07-01',
    endDate: '2021-08-31',
    description: 'tbd',
    category: 'Beruf',
    imageAssets: [
      'lib/assets/schuetz_01.jpg',
    ],
    highlights: [
      'tbd',
    ],
    links: [],
    references: [],
  ),
];

// MSF:
// latitude: -32.767139,
// longitude: 119.449047,


// Dillon:
// latitude: -45.934391,
// longitude: 168.670269,


// SIA Rapsulauks
// latitude: 56.808549,
// longitude: 22.525651,

// Schütz
// latitude: 51.930423,
// longitude: 11.804522,

// Dalhaus
// latitude: 51.628001,
// longitude: 6.996859,

// Suden
// latitude: 51.658620,
// longitude: 7.011799,


Map<String, List<Experience>> groupByQuarter(List<Experience> exps) {
  final Map<String, List<Experience>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year} Q${((start.month - 1) ~/ 3) + 1}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}

Map<String, List<Experience>> groupByYear(List<Experience> exps) {
  final Map<String, List<Experience>> grouped = {};
  for (final exp in exps) {
    final start = DateTime.parse(exp.startDate);
    final key = '${start.year}';
    grouped.putIfAbsent(key, () => []).add(exp);
  }
  final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
  return {for (var k in sortedKeys) k: grouped[k]!};
}

final groupedExperiences = groupByYear(experiences);

class Experience {
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
  final List<String>  imageAssets;
  final List<String> highlights;
  final List<String> links;
  final List<String> references;


  const Experience({
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
