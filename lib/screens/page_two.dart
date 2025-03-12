import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_company/global/page_one_info.dart';
import 'package:null_company/global/page_two_info.dart';
import 'package:null_company/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class page_two extends StatelessWidget {
  page_two({super.key});


//=======================================================================================================functions

  void _showMessage(BuildContext context) {         // هيبعت رسايل عشوائية في حالة مفيش ملف ios (والرسايل دي موجودة في ملف page_one_info)

  final randomMessage = (messages..shuffle()).first;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        randomMessage,
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

  void _downloadApk() async {
    final Uri url = Uri.parse(appTwoURL);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  void _IOS_downloadApk() async {
    final Uri url = Uri.parse(IOS_appTwoURL!);

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
        title: const Text(appTwoName),
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
                  margin: const EdgeInsets.only(right: 10),
                  width: 60,   // MediaQuery.of(context).size.shortestSide * 0.15, // العرض
                  height: 60,  //MediaQuery.of(context).size.shortestSide * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(appTwoLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: const Text(appTwoName, style: TextStyle( color: Colors.black, fontSize: 30 , fontWeight: FontWeight.w900),),
              subtitle: const Row(
                children: [
                  Icon(Icons.cloud_download_outlined, color: Colors.black),
                  SizedBox(width: 5),
                  Text(appTwoSize, style: TextStyle( color: Colors.black, fontSize: 15 , fontWeight: FontWeight.w900),),
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
                        borderRadius: BorderRadius.circular(10),
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
                        borderRadius: BorderRadius.circular(10),
                    ),),
                  ),
                  onPressed: () {
                    IOS_appTwoURL == null ? _showMessage(context) : _IOS_downloadApk() ;
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
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 0.3,
            ),
            items: appTwoImages.map((imagePath) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),
        const SizedBox(height: 50),
        const Text("What is $appTwoName?", 
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
    appTwoDescription,
    style: TextStyle(
        color: Colors.black, 
        fontSize: 15, 
        fontWeight: FontWeight.w900
    ), 
    textAlign: TextAlign.center,
  ),
),
const SizedBox(height: 40),
const Text("$appTwoName’s Top Features", 
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
    children: appTwoFeatures.map((feature) {
      return Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black, size: 20),
            onPressed: () {
              facebook();
            },
          ),
          const SizedBox(width: 5),
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
          const SizedBox(width: 5),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.globe, color: Colors.black, size: 20),
            onPressed: () {
              website();
            },
          ),
        ],
        ),
      ]),
    );
  }
}