import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart' show rootBundle;
import 'main_layout.dart';
import 'l10n/app_localizations.dart';
import 'analytics.dart' as analytics;

class HomePage extends StatefulWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const HomePage({Key? key, required this.toggleLocale, required this.locale})
    : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    analytics.logPageView("home");
  }

  @override
  void dispose() {
    analytics.logPageViewDuration('home', _startTime);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isGerman = widget.locale.languageCode == 'de';

    return MainLayout(
      mainText: AppLocalizations.of(context)!.greeting,
      lowerText: AppLocalizations.of(context)!.profession,
      toggleLocale: widget.toggleLocale,
      locale: widget.locale,
      silvers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Me
              Text(
                AppLocalizations.of(context)!.aboutMe,
                style: GoogleFonts.inter(fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Navigation Tiles
              _NavTile(
                title: AppLocalizations.of(context)!.experience,
                imagePath: 'assets/experience.jpg',
              ),
              const SizedBox(height: 16),

              _NavTile(
                title: AppLocalizations.of(context)!.education,
                imagePath: 'assets/education.jpeg',
              ),
              const SizedBox(height: 16),

              _NavTile(
                title: AppLocalizations.of(context)!.volunteering,
                imagePath: 'assets/volunteering.jpg',
              ),
              const SizedBox(height: 16),
              _NavTile(title: 'Portfolio', imagePath: 'assets/portfolio.jpg'),

              const SizedBox(height: 32),

              // Footer
              Center(
                child: ElevatedButton.icon(
                  label: Text(
                    isGerman ? 'Lebenslauf herunterladen' : 'Download CV',
                  ),
                  icon: const Icon(Icons.download),
                  onPressed: () async {
                    analytics.logContactButtonUsed("download_cv");
                    String pdfPath = "web_assets/CV_Simon-Tenbusch_2026.pdf";
                    final Uri uri = Uri.parse(pdfPath);
                    if (!await launchUrl(
                      uri,
                      mode: LaunchMode.platformDefault,
                    )) {
                      throw 'Could not launch $pdfPath';
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  isGerman ? 'Kontakt' : 'Contact',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.mail, size: 16), //color: Color.white),
                        onPressed: () {
                          analytics.logContactButtonUsed("mailto");
                          launchUrl(Uri.parse('mailto:simon@tenbusch.de'));
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text('simon@tenbusch.de'),
                    ],
                  ),
                  // const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.phone,
                          size: 16,
                        ), //color: Colors.grey[300]),
                        onPressed: () {
                          analytics.logContactButtonUsed("call");
                          launchUrl(Uri.parse('tel:+64273210061'));
                        },
                      ),
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

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.download),
                  label: Text(isGerman ? 'Kontakt speichern' : 'Save Contact'),
                  onPressed: () async {
                    analytics.logContactButtonUsed("download_vcard");
                    final data = await rootBundle.load('assets/contact.vcf');
                    final bytes = data.buffer.asUint8List();
                    final blob = html.Blob([bytes], 'text/vcard');
                    final url = html.Url.createObjectUrlFromBlob(blob);
                    final anchor =
                        html.AnchorElement(href: url)
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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Tooltip(
                      message:
                          'https://www.linkedin.com/in/simon-tenbusch-a67259198/',
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            analytics.logContactButtonUsed("linkedin");
                            launchUrl(
                              Uri.parse(
                                'https://www.linkedin.com/in/simon-tenbusch-a67259198/',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Tooltip(
                      message: "https://github.com/tenbuschs",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            analytics.logContactButtonUsed("github");
                            launchUrl(
                              Uri.parse('https://github.com/tenbuschs'),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Tooltip(
                      message: "https://www.youtube.com/@flyingsimmi",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.youtube,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            analytics.logContactButtonUsed("youtube");
                            launchUrl(
                              Uri.parse('https://www.youtube.com/@flyingsimmi'),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Tooltip(
                      message: "https://www.fiverr.com/s/kLjN5Eo",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Image.asset("assets/fiverr.png"),
                          onPressed: () {
                            analytics.logContactButtonUsed("fiverr");
                            launchUrl(
                              Uri.parse('https://www.youtube.com/@flyingsimmi'),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

// Navigate to pages
class _NavTile extends StatefulWidget {
  final String title;
  final String imagePath;

  const _NavTile({required this.title, required this.imagePath});

  @override
  State<_NavTile> createState() => _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool _hovering = false;

  void _handleTap(BuildContext context) async {
    if (widget.title == 'Education' || widget.title == 'Ausbildung') {
      analytics.logNavTileUsed("education");
      Navigator.pushNamed(context, '/education');
    }
    if (widget.title == 'Experience' || widget.title == 'Berufserfahrung') {
      analytics.logNavTileUsed("experience");
      Navigator.pushNamed(context, '/experience');
    }
    if (widget.title == AppLocalizations.of(context)!.volunteering) {
      analytics.logNavTileUsed("volunteering");
      Navigator.pushNamed(context, '/volunteering');
    }
    if (widget.title == 'Portfolio') {
      analytics.logNavTileUsed("portfolio");
      Navigator.pushNamed(context, '/portfolio');
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
