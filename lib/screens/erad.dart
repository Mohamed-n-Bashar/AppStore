import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_company/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Erad extends StatelessWidget {
  Erad({super.key});

final ScrollController _scrollController = ScrollController();
    final List<String> imagePaths = [
    'assets/images/erad/s1.png',
    'assets/images/erad/s2.png',
    'assets/images/erad/s3.png',
    'assets/images/erad/s5.png',
    'assets/images/erad/s6.png',
    'assets/images/erad/s7.png',
    'assets/images/erad/s8.png',
    'assets/images/erad/s9.png',
    'assets/images/erad/s10.png',
    'assets/images/erad/s4.png',
  ];
  final List<Map<String, dynamic>> features = [
  {
    "icon": Icons.inventory_2, 
    "title": "Advanced Product Management",
    "description": "Easily add, edit, and apply discounts to your products with full control."
  },
  {
    "icon": Icons.point_of_sale, 
    "title": "Smart Invoice System",
    "description": "Create and manage invoices like a pro! Scan barcodes or search by name for quick billing."
  },
  {
    "icon": Icons.receipt_long, 
    "title": "Invoice History & Returns",
    "description": "Find past invoices easily, modify them, or process product returns effortlessly."
  },
  {
    "icon": Icons.search, 
    "title": "Fast Product Lookup",
    "description": "Instantly find any product by barcode or name—no more manual searching!"
  },
  {
    "icon": Icons.bar_chart, 
    "title": "Profit Insights & Analytics",
    "description": "Track daily and monthly profits with clear charts highlighting your best days."
  },
  {
    "icon": Icons.shopping_cart, 
    "title": "Sales Overview",
    "description": "Monitor daily and monthly sales trends with interactive visual charts."
  },
  {
    "icon": Icons.store, 
    "title": "Store Dashboard",
    "description": "View key business details: stock levels, product categories, and total inventory value."
  },
  {
    "icon": Icons.person, 
    "title": "Personalized Business Profile",
    "description": "Customize your store’s name, logo, and essential business details effortlessly."
  },
];


  void _showJoke(BuildContext context) {
  final jokes = [
  "🚧 iOS version is still loading... Please wait... forever! 😆",
  "🍏 iOS version is coming... Just like that message you left on ‘Seen’! 😂",
  "⏳ Patience is key! iOS version is coming... one day... maybe! 🤣",
  "🤖 We asked Siri about the iOS version... She said ‘Ask me later’! 😜",
  "🚀 This button does not work today... and probably not tomorrow either! 😆",
  "🏖️ This button is on vacation... indefinitely! 😂"
  ];


  final randomJoke = (jokes..shuffle()).first; // اختيار مزحة عشوائية

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        randomJoke,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

//=======================================================================================================functions
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, // الانتقال لنهاية الصفحة
      duration: const Duration(milliseconds: 500), // مدة الحركة
      curve: Curves.easeInOut, // سلاسة التمرير
    );
  }

  void _downloadApk() async {
  final Uri url = Uri.parse("https://drive.google.com/uc?export=download&id=1dbqFxwHzDGMRHkL_C2DbzKP83q7jNzw8");

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}
//=======================================================================================================functions


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("إيراد"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListTile(
              leading: Transform.scale(
                scale: 1.5,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 60,   // MediaQuery.of(context).size.shortestSide * 0.15, // العرض
                  height: 60,  //MediaQuery.of(context).size.shortestSide * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // تدوير الحواف
                    image: const DecorationImage(
                      image: AssetImage("assets/images/frontlogo.jpg"), // استبدلها بمسار صورتك
                      fit: BoxFit.cover, // لجعل الصورة تغطي الخلفية بالكامل
                    ),
                  ),
                ),
              ),
              title: const Text("إيراد", style: TextStyle( color: Colors.black, fontSize: 30 , fontWeight: FontWeight.w900),),
              subtitle: const Row(
                children: [
                  Icon(Icons.cloud_download_outlined, color: Colors.black),
                  SizedBox(width: 5),
                  Text("24 MB", style: TextStyle( color: Colors.black, fontSize: 15 , fontWeight: FontWeight.w900),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Colors.black),
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    )),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // تدوير الحواف بالكامل
                      ),
                    ),
                  ),
              onPressed: () {
                _downloadApk();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.android, color: Colors.green, size: 24),
                  SizedBox(width: 10),
                  Text("Download",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),),
                const SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.black),
                    minimumSize: WidgetStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.07,
                      )), // عرض 200 وطول 60
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // تدوير الحواف بالكامل
                    ),),
                  ),
                  onPressed: () {
                    _showJoke(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.grey[350], size: 30),
                      const SizedBox(width: 10),
                      const Text("Soon...",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          CarouselSlider(
            options: CarouselOptions(
              height: 200, // ارتفاع السلايدر
              enlargeCenterPage: true, // تكبير الصورة في المنتصف
              autoPlay: true, // تشغيل تلقائي
              autoPlayInterval: Duration(seconds: 3), // مدة الانتقال
              viewportFraction: 0.3, // نسبة عرض الصورة في الشاشة
            ),
            items: imagePaths.map((imagePath) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: const [
                  //   BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 2),
                  // ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),
        const SizedBox(height: 50),
        const Text("What is Erad?", 
    style: TextStyle(
        color: Colors.black, 
        fontSize: 25, 
        fontWeight: FontWeight.w900, 
        fontFamily: "web"
    ), 
    textAlign: TextAlign.center,
),
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: Text(
    "Erad is your smart cashier system, helping businesses track sales, manage inventory, and generate reports—all in one place. \nForget manual calculations and start automating your business today! 📊",
    style: TextStyle(
        color: Colors.black, 
        fontSize: 15, 
        fontWeight: FontWeight.w900
    ), 
    textAlign: TextAlign.center,
  ),
),
const SizedBox(height: 40),
const Text("Erad’s Top Features", 
    style: TextStyle(
        color: Colors.black, 
        fontSize: 25, 
        fontWeight: FontWeight.w900, 
        fontFamily: "web"
    ), 
    textAlign: TextAlign.center,
),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: features.map((feature) {
      return Card(
        color: Colors.black, // لون الكارت
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4, // ظل خفيف
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                feature["icon"],
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feature["title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      feature["description"],
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  ),
),

      const SizedBox(height: 20),
      const Text("null", style: TextStyle( color: Colors.black, fontSize: 25 , fontWeight: FontWeight.w900, fontFamily: "eng"),textAlign: TextAlign.center,),
      // const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black, size: 20),
            onPressed: () {
              facebook();
            },
          ),
          const SizedBox(width: 5), // مسافة بين الأيقونات
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.black, size: 20),
            onPressed: () {
              linkedIn();
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.black, size: 20),
            onPressed: () {
              youtube();
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidEnvelope, color: Colors.black, size: 20),
            onPressed: () {
              email();
            },
          ),
        ],
        ),
      ]),
    );
  }
}