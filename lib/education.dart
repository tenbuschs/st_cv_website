import 'package:flutter/material.dart';
import 'main_layout.dart';


class EducationPage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const EducationPage({super.key, required this.toggleLocale, required this.locale});


  @override
  Widget build(BuildContext context) {
    return MainLayout(
      toggleLocale: toggleLocale,
      locale: locale,
      silvers: [ SliverToBoxAdapter(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Education',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Text(
              'B.Sc. Computer Science\nUniversity of Example\n2018 - 2022',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'M.Sc. Software Engineering\nInstitute of Example\n2022 - Present',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      ]
    );
  }
}