/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'education.dart' as edu;
import 'experience.dart' as exp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en' ? const Locale('de') : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simon Tenbusch',
     /* theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: Colors.grey[200],
          displayColor: Colors.grey[200],
        ),
        cardColor: const Color(0xFF1E4030),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D6045),
            foregroundColor: Colors.white,
          ),
        ),
      ),*/
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('de')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomePage(toggleLocale: _toggleLocale, locale: _locale),
      routes: {
        '/education': (context) => const edu.EducationPage(),
        '/experience': (context) => const exp.ExperiencePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const HomePage({super.key, required this.toggleLocale, required this.locale});

  @override
  Widget build(BuildContext context) {
    final isGerman = locale.languageCode == 'de';

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double contentWidth = screenWidth > 700
              ? screenWidth * 0.6
              : screenWidth - 32; // 16px margin on each side

          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: contentWidth,
                padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 72,
                          backgroundImage: AssetImage('lib/assets/profile.jpg'),
                          backgroundColor: const Color(0xFF2D6045),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      isGerman ? 'Moin, ich bin Simon' : "Hi, I'm Simon",
                                      style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.language, color: Colors.grey[300]),
                                    onPressed: toggleLocale,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                isGerman
                                    ? 'Fachkraft für Agrartechnologie & Datenanalyse'
                                    : 'Agri-Tech Specialist & Data Analyst',
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // About Me
                    Text(
                      isGerman
                          ? 'Ich bin ein leidenschaftlicher Spezialist für Präzisionslandwirtschaft mit Erfahrung in Datenanalyse, R und GIS.'
                          : 'I am a passionate precision agriculture specialist with experience in data analysis, R, and GIS.',
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                    const SizedBox(height: 32),

                    // Navigation Tiles
                    _NavTile(title: isGerman ? 'Ausbildung' : 'Education', imagePath: 'lib/assets/education.jpeg'),
                    const SizedBox(height: 16),
                    _NavTile(title: isGerman ? 'Berufserfahrung' : 'Experience', imagePath: 'lib/assets/experience.jpg'),
                    const SizedBox(height: 16),
                    _NavTile(title: 'Portfolio', imagePath: 'lib/assets/portfolio.jpg'),

                    const SizedBox(height: 32),

                    // Footer
                    Center(
                      child: ElevatedButton.icon(
                        label:  Text(isGerman ? 'Lebenslauf herunterladen' : 'Download CV'),
                        icon: const Icon(Icons.download),
                        onPressed: () async {
                          const url = 'https://example.com/MaxMustermannCV.pdf';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Text(
                        isGerman ? 'Kontakt' : 'Contact',
                        style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, size: 16, color: Colors.grey[300]),
                            const SizedBox(width: 8),
                            const Text('simon@tenbusch.de'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 16, color: Colors.grey[300]),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('NZ: +64 27 321 00 61'),
                                SizedBox(height: 4),
                                Text('DE: +49 1578 646 1 989'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Center(child: ElevatedButton.icon(
                      icon: const Icon(Icons.download),
                      label: Text(isGerman ? 'Kontakt speichern' : 'Save Contact'),
                      onPressed: () async {
                        final data = await rootBundle.load('lib/assets/contact.vcf');
                        final bytes = data.buffer.asUint8List();
                        final blob = html.Blob([bytes], 'text/vcard');
                        final url = html.Url.createObjectUrlFromBlob(blob);
                        final anchor = html.AnchorElement(href: url)
                          ..setAttribute('download', 'SimonTenbusch.vcf')
                          ..click();
                        html.Url.revokeObjectUrl(url);
                      },
                    ),
                    ),

                    const SizedBox(height: 32),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.mail, color: Colors.black),
                            onPressed: () => launchUrl(Uri.parse('mailto:simon@tenbusch.de')),
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.black),
                            onPressed: () => launchUrl(Uri.parse('https://www.linkedin.com/in/simon-tenbusch-a67259198/')),
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.github, color: Colors.black),
                            onPressed: () => launchUrl(Uri.parse('https://github.com/max')),
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.black),
                            onPressed: () => launchUrl(Uri.parse('https://youtube.com/')),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Credits
                    Center(
                      child: Text(
                        '© 2025 Simon Tenbusch',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// Navigate to pages
class _NavTile extends StatefulWidget {
  final String title;
  final String imagePath;

  const _NavTile({required this.title, required this.imagePath, Key? key}) : super(key: key);

  @override
  State<_NavTile> createState() => _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool _hovering = false;

  void _handleTap(BuildContext context) {
    if (widget.title == 'Education' || widget.title == 'Ausbildung') {
      Navigator.pushNamed(context, '/education');
    }
    if (widget.title == 'Experience' || widget.title == 'Berufserfahrung') {
      Navigator.pushNamed(context, '/experience');
    }
    // Add more navigation logic for other tiles if needed
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => _handleTap(context),
        child: Container(
          width: double.infinity,
          height: 240,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AnimatedScale(
                  scale: _hovering ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  child: Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withAlpha((0.4 * 255).toInt()),
                ),
              ),
              Center(
                child: Text(
                  widget.title,
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/
