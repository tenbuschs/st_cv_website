import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'l10n/app_localizations.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> silvers;
  final VoidCallback toggleLocale;
  final Locale locale;

  const MainLayout({
    super.key,
    required this.silvers,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed:
                      () => Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed:
                      () =>
                          Navigator.pushReplacementNamed(context, '/education'),
                  child: Text(
                    AppLocalizations.of(context)!.education,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed:
                      () => Navigator.pushReplacementNamed(
                        context,
                        '/experience',
                      ),
                  child: Text(
                    AppLocalizations.of(context)!.experience,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //SizedBox(width: 300,),
                IconButton(
                  icon: Icon(Icons.language, color: Colors.grey[300]),
                  onPressed: toggleLocale,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 48,
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      HeaderWithAvatar(
                        mainText: AppLocalizations.of(context)!.greeting,
                        lowerText: AppLocalizations.of(context)!.profession,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
              ...silvers,
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 40,
        alignment: Alignment.center,
        child: Text(
          '© 2025 Simon Tenbusch',
          style: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}

class HeaderWithAvatar extends StatelessWidget {
  final String mainText;
  final String lowerText;

  const HeaderWithAvatar({
    super.key,
    required this.mainText,
    required this.lowerText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          child: CircleAvatar(
            radius: 72,
            backgroundImage: AssetImage('lib/assets/profile.jpg'),
            backgroundColor: const Color(0xFF2D6045),
          ),
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
                      mainText,
                      style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(lowerText, style: GoogleFonts.inter(fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }
}
