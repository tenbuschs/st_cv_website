import 'package:flutter/material.dart';
import 'main_layout.dart';
import 'package:url_launcher/url_launcher.dart';
import 'l10n/app_localizations.dart';
import 'image_carousel.dart';
import 'dart:async';

class PortfolioPage extends StatelessWidget {
  final VoidCallback toggleLocale;
  final Locale locale;

  const PortfolioPage({
    super.key,
    required this.toggleLocale,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      mainText: "Portfolio",
      lowerText: "Simon Tenbusch",
      toggleLocale: toggleLocale,
      locale: locale,
      silvers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GIS Work
              PortfolioCard(
                title: AppLocalizations.of(context)!.gisTitle,
                description: AppLocalizations.of(context)!.gisDescription,
                tags: [
                  AppLocalizations.of(context)!.gisTag1,
                  AppLocalizations.of(context)!.gisTag2,
                  AppLocalizations.of(context)!.gisTag3,
                  AppLocalizations.of(context)!.gisTag4,
                ],
                images: [
                  "assets/gis_01.jpg",
                  "assets/gis_02.jpg",
                  "assets/gis_03.jpg",
                ],
                link: "pdf",
              ),

              // Freshwater Farm Plan
              PortfolioCard(
                title: AppLocalizations.of(context)!.fwfpTitle,
                description: AppLocalizations.of(context)!.fwfpDescription,
                tags: [
                  AppLocalizations.of(context)!.fwfpTag1,
                  AppLocalizations.of(context)!.fwfpTag2,
                  AppLocalizations.of(context)!.fwfpTag3,
                  AppLocalizations.of(context)!.fwfpTag4,
                ],
                images: [
                  "assets/fwfp_01.jpg",
                  "assets/fwfp_02.jpg",
                  "assets/fwfp_03.jpg",
                ],
                link: null,
              ),

              // Farm Management Simulator
              PortfolioCard(
                title: AppLocalizations.of(context)!.fmsTitle,
                description: AppLocalizations.of(context)!.fmsDescription,
                tags: [
                  AppLocalizations.of(context)!.fmsTag1,
                  AppLocalizations.of(context)!.fmsTag2,
                  AppLocalizations.of(context)!.fmsTag3,
                ],
                images: ["assets/fms.jpg"],
                link: "https://simontenbusch1158809.pythonanywhere.com/",
              ),

              // YouTube Channel
              PortfolioCard(
                title: AppLocalizations.of(context)!.youtubeTitle,
                description:
                    AppLocalizations.of(
                      context,
                    )!.youtubeDescription, //"Test",//AppLocalizations.of(context)!.youtubeDescription,                    '',
                tags: [
                  AppLocalizations.of(context)!.youtubeTag1,
                  AppLocalizations.of(context)!.youtubeTag2,
                  AppLocalizations.of(context)!.youtubeTag3,
                  AppLocalizations.of(context)!.youtubeTag4,
                ],
                images: ["assets/youtube.jpg"],
                link: 'https://www.youtube.com/@flyingsimmi',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PortfolioCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tags;
  final List<String> images;
  final String? link;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    required this.images,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            if (images.isNotEmpty) ...[
              ImageCarousel(images: images),
              const SizedBox(height: 12),
            ],
            Text(description),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        tags
                            .map(
                              (tag) => Chip(
                                label: Text(tag),
                                backgroundColor: Color(0xFF2D6045),
                              ),
                            )
                            .toList(),
                  ),
                ),
                if (link!=null && link == "pdf")
                  TextButton.icon(
                    onPressed: () => openPDF('web_assets/gis_report.pdf'),
                    icon: const Icon(Icons.picture_as_pdf),
                    label: Text(AppLocalizations.of(context)!.viewProject),
                  ),
                if (link!=null && link != "pdf")
                  TextButton.icon(
                    onPressed: () {
                      launchUrl(Uri.parse(link!));
                    },
                    icon: const Icon(Icons.open_in_new),
                    label: Text(AppLocalizations.of(context)!.viewProject),
                  ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openPDF(String pdfPath) async {
  final Uri uri = Uri.parse(pdfPath);

  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    throw 'Could not launch $pdfPath';
  }
}
