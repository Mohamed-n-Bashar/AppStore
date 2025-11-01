import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:null_company/global/page_3_info.dart';
import 'package:null_company/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class PageFitTrack extends StatefulWidget {
  const PageFitTrack({super.key});

  @override
  State<PageFitTrack> createState() => _PageFitTrackState();
}

class _PageFitTrackState extends State<PageFitTrack> {
  final ScrollController _scrollController = ScrollController();
  int _carouselIndex = 0;

  void _downloadIOS() => _showSnack("iOS version coming soon");

  void _downloadAndroid() async {
    final Uri url = Uri.parse(fittrackappURL);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  void _showSnack(String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), backgroundColor: const Color(0xFF191919),));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF191919),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 768;
          final double horizontalPadding = isMobile ? 20 : 80;

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // HERO SECTION
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: isMobile ? 40 : 80),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      // colors: [Color(0xFF5B86E5), Color(0xFF36D1DC)],
                      colors: [Color(0xFF191919), Color(0xFF191919)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: isMobile ? 48 : 60,
                        backgroundImage: const AssetImage(fittrackappLogo),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        fittrackappName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 26 : 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fittrackappSize,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _downloadAndroid,
                            icon: const FaIcon(FontAwesomeIcons.android, size: 16),
                            label: const Text('Get Android App'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: _downloadIOS,
                            icon: const FaIcon(FontAwesomeIcons.apple, size: 16),
                            label: const Text('Soon...'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white70),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ABOUT SECTION
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "About the App",
                        style: TextStyle(
                            fontSize: isMobile ? 22 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        fittrackappDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: isMobile ? 14 : 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),

                // SCREENSHOTS
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        "App Screenshots",
                        style: TextStyle(
                            fontSize: isMobile ? 22 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 20),
                      _buildCarousel(isMobile),
                    ],
                  ),
                ),

                // FEATURES GRID
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 60),
                  child: Column(
                    children: [
                      Text(
                        "Main Features",
                        style: TextStyle(
                            fontSize: isMobile ? 22 : 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 24),
                      LayoutBuilder(builder: (context, constraints) {
                        int crossAxisCount = 1;
                        if (constraints.maxWidth > 1100) crossAxisCount = 3;
                        else if (constraints.maxWidth > 700) crossAxisCount = 2;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: fittrackappFeatures.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 3.2,
                          ),
                          itemBuilder: (context, index) {
                            final f = fittrackappFeatures[index];
                            return _featureTile(
                                f["icon"], f["title"], f["description"], isMobile ,context);
                          },
                        );
                      }),
                    ],
                  ),
                ),

                // FOOTER
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 40),
                  child: Column(
                    children: [
                      Text(
                        "Stay Connected",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 18 : 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: isMobile ? 7 : 20,
                        children: const [
                          IconButton(
                              onPressed: facebook,
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              color: Colors.white),
                          IconButton(
                              onPressed: linkedIn,
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              color: Colors.white),
                          IconButton(
                              onPressed: youtube,
                              icon: FaIcon(FontAwesomeIcons.youtube),
                              color: Colors.white),
                          IconButton(
                              onPressed: email,
                              icon: FaIcon(FontAwesomeIcons.solidEnvelope),
                              color: Colors.white),
                          IconButton(
                              onPressed: website,
                              icon: FaIcon(FontAwesomeIcons.globe),
                              color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "© ${DateTime.now().year} $fittrackappName. All rights reserved.",
                        style:
                            const TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarousel(bool isMobile) {
    final double height = isMobile ? 400 : 500;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: fittrackappImages.length,
          itemBuilder: (context, index, realIdx) {
            final img = fittrackappImages[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4))
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(img,
                    fit: BoxFit.contain, width: double.infinity, height: height),
              ),
            );
          },
          options: CarouselOptions(
            height: height,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: isMobile ? 0.75 : 0.35,
            onPageChanged: (i, _) => setState(() => _carouselIndex = i),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(fittrackappImages.length, (i) {
            final bool active = i == _carouselIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color:
                    active ? Colors.indigo : Colors.indigo.withOpacity(0.25),
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _featureTile(dynamic icon, String title, String desc, bool isMobile, BuildContext context) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    padding: EdgeInsets.all(isMobile ? 12 : 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 6),
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // مهم للنصوص الطويلة
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 8 : 10),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.indigo, size: isMobile ? 22 : 26),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 14 : 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: isMobile ? 12.5 : 13.5,
                  height: 1.4,
                ),
                softWrap: true, // ✅ يسمح بلف النص
                overflow: TextOverflow.visible, // ✅ يمنع القطع
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
