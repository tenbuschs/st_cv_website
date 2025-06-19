import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'home.dart';
import 'education.dart' as edu;
import 'experience.dart' as exp;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale =
      _locale.languageCode == 'en'
          ? const Locale('de')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simon Tenbusch',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData
              .dark()
              .textTheme,
        ).apply(bodyColor: Colors.grey[200], displayColor: Colors.grey[200]),
        cardColor: const Color(0xFF1E4030),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D6045),
            foregroundColor: Colors.white,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2D6045), width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: Color(0xFF2D6045),
          floatingLabelStyle: TextStyle(color: Color(0xFF2D6045)),
        ),

      ),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/home',
      routes: {
       // '/': (context) => LoginPage(),
       /* '/home': (context) =>
            HomePage(
                toggleLocale: _toggleLocale,
                locale: _locale
            ),
        '/education': (context) => edu.EducationPage(  toggleLocale: _toggleLocale,
            locale: _locale),
        '/experience': (context) => exp.ExperiencePage(  toggleLocale: _toggleLocale,
            locale: _locale),*/
        '/home': (context) => AuthGate(child: HomePage(
            toggleLocale: _toggleLocale,
            locale: _locale
        ),),
        '/education': (context) => AuthGate(child: edu.EducationPage(  toggleLocale: _toggleLocale,
            locale: _locale),),
        '/experience': (context) => AuthGate(child: exp.ExperiencePage(  toggleLocale: _toggleLocale,
            locale: _locale),),
      },
    );
  }
}




class AuthGate extends StatelessWidget {
  final Widget child;
  const AuthGate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return child; // User is logged in
        }
        return LoginPage();
      },
    );
  }
}