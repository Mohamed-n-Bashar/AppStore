import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:null_company/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentTesti = 0;

  // Dummy data - استبدلها بالبيانات الحقيقية
  final List<Product> products = [
    Product(id: 'app3', title: 'FitTrack', subtitle: 'Track & Grow Gym', image: 'assets/images/FitTrack.png'),
    Product(id: 'app4', title: 'Saror Rental', subtitle: 'Car Rental Business', image: 'assets/images/logo.jpg'),
    Product(id: 'app2', title: 'Erad', subtitle: 'Fast & Easy Cashier', image: 'assets/images/frontlogo.jpg'),
    Product(id: 'app1', title: 'Linkat', subtitle: 'Simple & Smart Notes', image: 'assets/images/LinKat_LOGO.png'),
  ];

  final List<Testimonial> testimonials = [
    Testimonial(name: 'Salah Saror', role: 'bro.nh car', quote: 'الصراحة طوب 10/10 والله والمعاملة جيدة جدااا ,أنا كتعجبني الكلمة والخدمة المتقونة.', avatar: 'assets/images/client.png', email: 'bro.nhcar@gmail.com', countryCode: 'MA'),
    Testimonial(name: 'Alaa Mahmoud', role: '', quote: 'انا من معاملتي عايزه اقول ان بجد معامله كويسه جدا جدا وزي ما بطلب الحاجه بتبعتلي احسن منها ما شاء الله اللهم بارك وكمان بتتنفذ في وقت قياسي حرفيا وشكرا جدا', avatar: 'assets/images/client.png', email: 'alaamahmoudsalah3@gmail.com', countryCode: 'EG'),
  ];

  // Colors
  final Gradient heroGradient = const LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF0B1220)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  final Gradient heroGradient2 = const LinearGradient( 
    colors: [Color(0xFF0A0A0A), Color(0xFF1C1C1C)], 
    begin: Alignment.bottomLeft, 
    end: Alignment.topRight, 
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // URL helpers
  // Future<void> _launchUrl(String url) async {
  //   final uri = Uri.parse(url);
  //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open link')));
  //   }
  // }

  // small helper for responsive sizes
  double vw(double fraction, BuildContext ctx) => MediaQuery.of(ctx).size.width * fraction;

  double vh(double percent, BuildContext context) => MediaQuery.of(context).size.height * percent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // HERO SECTION
              Container(
  width: double.infinity,
  constraints: BoxConstraints(
    minHeight: vh(1.0, context),
  ),
  decoration: BoxDecoration(gradient: heroGradient2),
  child: SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: vw(isMobile ? 0.06 : 0.08, context),
        vertical: vh(isMobile ? 0.05 : 0.04, context),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ---------------- HEADER ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: vw(isMobile ? 0.13 : 0.038, context),
                      height: vw(isMobile ? 0.13 : 0.038, context),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/null.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'null',
                      style: TextStyle(
                        fontFamily: 'eng',
                        fontSize: vw(isMobile ? 0.07 : 0.02, context),
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: vh(isMobile ? 0.1 : 0.05, context)),

            // ---------------- HERO ----------------
            Stack(
              alignment: Alignment.center,
              children: [
                // خلفية نصية شفافة
                Opacity(
                  opacity: 0.0,
                  child: Text(
                    'null',
                    style: TextStyle(
                      fontFamily: 'eng',
                      fontSize: vw(isMobile ? 0.38 : 0.22, context),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6,
                      color: Colors.grey,
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(
                      width: vw(isMobile ? 0.95 : 0.6, context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ---------- TITLE ----------
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: vw(isMobile ? 0.085 : 0.045, context),
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              height: 1.3,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Software Solutions for Everyday Needs',
                                  textAlign: TextAlign.center,
                                  speed: const Duration(milliseconds: 35),
                                ),
                              ],
                              isRepeatingAnimation: false,
                            ),
                          ),

                          SizedBox(height: vh(isMobile ? 0.03 : 0.02, context)),

                          // ---------- SUBTITLE ----------
                          Text(
                            'We craft innovative and practical applications that simplify daily life and deliver seamless experiences.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: vw(isMobile ? 0.043 : 0.018, context),
                              height: 1.5,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          SizedBox(height: vh(isMobile ? 0.08 : 0.04, context)),

                          // ---------- BUTTONS ----------
                          Wrap(
                            spacing: 14,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _scrollToProducts,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        vw(isMobile ? 0.2 : 0.06, context),
                                    vertical:
                                        vh(isMobile ? 0.028 : 0.018, context),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3,
                                ),
                                child: Text(
                                  'Our Products',
                                  style: TextStyle(
                                    fontSize:
                                        vw(isMobile ? 0.043 : 0.018, context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                onPressed: whatsapp,
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  size: vw(isMobile ? 0.065 : 0.02, context),
                                ),
                                label: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontSize:
                                        vw(isMobile ? 0.043 : 0.018, context),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        vw(isMobile ? 0.18 : 0.05, context),
                                    vertical:
                                        vh(isMobile ? 0.028 : 0.018, context),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: const BorderSide(color: Colors.white54),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: vh(isMobile ? 0.08 : 0.05, context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
),

              // ABOUT SECTION
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('About Us', style: TextStyle(color: Colors.black87, fontSize: isMobile ? 22 : 30, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: isMobile ? double.infinity : 900,
                      child: Text(
                        'We build practical, reliable and beautiful apps focused on real user needs. From ideation to deployment and maintenance — our priority is quality, performance and great UX.',
                        style: TextStyle(color: Colors.black54, fontSize: isMobile ? 14 : 18, height: 1.6),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        _featureChip(Icons.speed, 'High Performance'),
                        _featureChip(Icons.palette, 'Polished Design'),
                        _featureChip(Icons.support_agent, 'Dedicated Support'),
                        _featureChip(Icons.lock, 'Secure by default'),
                      ],
                    ),
                  ],
                ),
              ),

              // PRODUCTS SECTION
              Container(
  width: double.infinity,
  color: Colors.grey.shade50,
  padding: EdgeInsets.symmetric(
    horizontal: vw(isMobile ? 0.05 : 0.08, context),
    vertical: vh(isMobile ? 0.05 : 0.08, context),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Products',
        style: TextStyle(
          color: Colors.black87,
          fontSize: vw(isMobile ? 0.055 : 0.022, context),
          fontWeight: FontWeight.w900,
        ),
      ),
      SizedBox(height: vh(isMobile ? 0.03 : 0.05, context)),

      SizedBox(
        width: isMobile ? double.infinity : 1100,
        child: AnimationLimiter(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: vw(0.04, context),
              mainAxisSpacing: vh(0.04, context),
              // خفّضنا النسبة دي علشان تمنع overflow على الموبايل
              childAspectRatio: isMobile ? 2.8 : 1.9,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                duration: const Duration(milliseconds: 500),
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: _productCard(p, isMobile, context),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ],
  ),
),

              const SizedBox(height: 24),

              // TESTIMONIALS SECTION
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 60),
                child: Column(
                  children: [
                    Text('What our clients say', style: TextStyle(color: Colors.black87, fontSize: isMobile ? 20 : 28, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: isMobile ? double.infinity : 900,
                      child: Column(
                        children: [
                          CarouselSlider.builder(
                            carouselController: _carouselController,
                            itemCount: testimonials.length,
                            options: CarouselOptions(
                              height: isMobile ? 220 : 260,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 10),
                              onPageChanged: (i, reason) => setState(() => _currentTesti = i),
                            ),
                            itemBuilder: (context, itemIndex, pageViewIndex) {
                              final t = testimonials[itemIndex];
                              return _testimonialCard(t, isMobile);
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: testimonials.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: _currentTesti == entry.key ? 14 : 10,
                                  height: _currentTesti == entry.key ? 14 : 10,
                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentTesti == entry.key ? Colors.indigo : Colors.grey.shade400,
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // CONTACT US SECTION
Container(
  width: double.infinity,
  color: Colors.grey.shade50,
  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 60),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Contact Us',
          style: TextStyle(
              color: Colors.black87,
              fontSize: isMobile ? 24 : 30,
              fontWeight: FontWeight.w800)),
      const SizedBox(height: 20),

      SizedBox(
        width: isMobile ? double.infinity : 700,
        child: const ContactForm(),
      ),
    ],
  ),
),


              // CONTACT / SOCIALS (small band)
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                child: Column(
                  children: [
                    Text('Stay connected', style: TextStyle(color: Colors.white, fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.bold)),
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
                  ],
                ),
              ),

              // FOOTER
              Container(
                width: double.infinity,
                color: Colors.black87,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: isMobile ? 20 : 80),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          children: [
                            // Container(
                            //   width: 48,
                            //   height: 48,
                            //   decoration: const BoxDecoration(
                            //     // shape: BoxShape.circle,
                            //     borderRadius: BorderRadius.all(Radius.circular(10)),
                            //     color: Colors.black,
                            //     image: DecorationImage(image: AssetImage('assets/images/null.jpg'), fit: BoxFit.cover),
                            //   ),
                            // ),
                            // const SizedBox(width: 12),
                            Text('null', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "eng")),
                          ],
                        ),
                        if (!isMobile)
                          Row(
                            children: [
                              TextButton(onPressed: _scrollToProductsUp, child: const Text('Products', style: TextStyle(color: Colors.white70))),
                              const SizedBox(width: 8),
                              TextButton(onPressed: () => whatsapp(), child: const Text('Contact', style: TextStyle(color: Colors.white70))),
                            ],
                          )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('© ${DateTime.now().year} Null Company. All rights reserved.', style: TextStyle(color: Colors.white54), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _featureChip(IconData icon, String text) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.indigo),
      label: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _productCard(Product p, bool isMobile, BuildContext context) {
  return InkWell(
    onTap: () {
      if (p.id == 'app1') {
        Navigator.pushNamed(context, '/page_one');
      } else if((p.id == 'app2')){
        Navigator.pushNamed(context, '/page_two');
      } else if((p.id == 'app3')){
        Navigator.pushNamed(context, '/page_fitTrack');
      } else if((p.id == 'app4')){
        Navigator.pushNamed(context, '/page_rental');
      }
    },
    borderRadius: BorderRadius.circular(16),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.all(vw(isMobile ? 0.035 : 0.018, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // الصورة
              Container(
                width: maxW * (isMobile ? 0.25 : 0.22),
                height: maxW * (isMobile ? 0.25 : 0.22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(p.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: vw(0.03, context)),

              // النصوص والأزرار
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      p.title,
                      style: TextStyle(
                        fontSize: vw(isMobile ? 0.05 : 0.022, context),
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: vh(0.008, context)),
                    Text(
                      p.subtitle,
                      style: TextStyle(
                        fontSize: vw(isMobile ? 0.035 : 0.016, context),
                        color: Colors.black54,
                        height: 1.4,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: vh(isMobile ? 0.008 : 0.018, context)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        onPressed: () {
                          if (p.id == 'app1') {
                            Navigator.pushNamed(context, '/page_one');
                          } else if((p.id == 'app2')){
                            Navigator.pushNamed(context, '/page_two');
                          } else if((p.id == 'app3')){
                            Navigator.pushNamed(context, '/page_fitTrack');
                          } else if((p.id == 'app4')){
                            Navigator.pushNamed(context, '/page_rental');
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.indigo),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: vw(isMobile ? 0.06 : 0.03, context),
                            vertical: vh(isMobile ? 0.015 : 0.01, context),
                          ),
                        ),
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                            fontSize: vw(isMobile ? 0.04 : 0.017, context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: vh(isMobile ? 0.008 : 0.0, context)),
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

  Widget _testimonialCard(Testimonial t, bool isMobile) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: isMobile ? 6 : 12, vertical: 6),
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 16 : 24,
      vertical: isMobile ? 12 : 18,
    ),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 6),
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // صورة العميل
        CircleAvatar(
          radius: isMobile ? 28 : 36,
          backgroundImage: AssetImage(t.avatar),
        ),
        const SizedBox(width: 14),

        // التفاصيل
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الاسم + العلم (كإيموجي)
              Row(
                children: [
                  Flexible(
                    child: Text(
                      t.name,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    countryFlagEmoji(t.countryCode),
                    style: TextStyle(fontSize: isMobile ? 18 : 22),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // الإيميل
              GestureDetector(
                onTap: () => email(email: t.email),
                child: Text(
                  t.email,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    color: Colors.indigo[700],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 6),

              // الوظيفة (اختياري)
              if (t.role.isNotEmpty)
                Text(
                  t.role,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    color: Colors.black54,
                  ),
                ),
              const SizedBox(height: 10),

              // النص أو التقييم
              Text(
                t.quote,
                style: TextStyle(
                  fontSize: isMobile ? 13 : 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// 🔤 دالة تحويل كود الدولة إلى إيموجي علم
String countryFlagEmoji(String countryCode) {
  final int base = 0x1F1E6; // حرف A في Unicode flags
  return countryCode.toUpperCase().runes.map((c) {
    return String.fromCharCode(base + c - 0x41);
  }).join();
}



  void _scrollToProducts() {
    // Scroll to approx products area (rough offset) — good for single page
    // We attempt to animate down by screen height
    final double offset = _scrollController.offset + MediaQuery.of(context).size.height * 1.4;
    _scrollController.animateTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent), duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }
  void _scrollToProductsUp() {
    // Scroll to approx products area (rough offset) — good for single page
    // We attempt to animate down by screen height
    final double offset = _scrollController.offset + MediaQuery.of(context).size.height * -1;
    _scrollController.animateTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent), duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }
}

class Product {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  Product({required this.id, required this.title, required this.subtitle, required this.image});
}

class Testimonial {
  final String name;
  final String role;
  final String quote;
  final String avatar;
  final String countryCode;
  final String email;
  Testimonial({required this.name, required this.role, required this.quote, required this.avatar, required this.countryCode, required this.email});
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is a placeholder for $title')),
    );
  }
}


class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);

    const serviceId = 'service_8c8ttso';
    const templateId = 'template_m7gdbk6';
    const publicKey = '_rPNOUL7zYYA9iOD6';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': _nameCtrl.text,
          'email': _emailCtrl.text,
          'phone': _phoneCtrl.text,
          'message': _messageCtrl.text,
        }
      }),
    );

    setState(() => _sending = false);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ Message sent successfully'), backgroundColor: Color(0xFF191919)),
      );
      _formKey.currentState!.reset();
      _nameCtrl.clear();
      _emailCtrl.clear();
      _phoneCtrl.clear();
      _messageCtrl.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Failed to send message'), backgroundColor: Color(0xFF191919)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final color = Colors.indigo[600];
    const color = Colors.black;

    return Center(
      child: Container(
        // constraints: const BoxConstraints(maxWidth: 450),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.mail_outline, color: color, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Name
              _buildTextField(
                controller: _nameCtrl,
                hint: 'Your Name',
                icon: Icons.person_outline,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 18),

              // Email
              _buildTextField(
                controller: _emailCtrl,
                hint: 'Your Email',
                icon: Icons.email_outlined,
                validator: (v) =>
                    v!.isEmpty || !v.contains('@') ? 'Invalid email' : null,
              ),
              const SizedBox(height: 18),

              // Phone
              _buildTextField(
                controller: _phoneCtrl,
                hint: 'Phone Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (v) =>
                    v!.isEmpty || v.length < 8 ? 'Invalid phone' : null,
              ),
              const SizedBox(height: 18),

              // Message
              _buildTextField(
                controller: _messageCtrl,
                hint: 'Message',
                icon: Icons.message_outlined,
                maxLines: 5,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 28),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sending ? null : _sendEmail,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 3,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _sending
                        ? const SizedBox(
                            key: ValueKey(1),
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
                            key: const ValueKey(2),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.send, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Send Message",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 15.5),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.black54),
        filled: true,
        fillColor: Colors.grey[50],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      ),
    );
  }
}

