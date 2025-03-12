import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_company/global/page_one_info.dart';
import 'package:null_company/global/page_two_info.dart';
import 'package:null_company/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});


  final ScrollController _scrollController = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768 && constraints.maxWidth < constraints.maxHeight) { // لو الشاشة أعرض من 768px
        return Scaffold(
          // backgroundColor: Colors.,
          appBar: AppBar(
            title: const Padding(padding: EdgeInsets.only(left: 10), child: Text("null", style: TextStyle(fontFamily: "eng", color: Colors.white, fontSize: 30),),),
            // leading:  const CircleAvatar(backgroundImage: AssetImage("assets/images/null.jpg"),  // يمكنك تغيير الحجم حسب الحاجة
            // backgroundColor: Colors.transparent,),
          ),
          body: ListView(
            controller: _scrollController,
                    children: [
                      // Section 1 (Hero Section)
                      Container(
                        height: MediaQuery.of(context).size.height, // يأخذ حجم الشاشة بالكامل
                        width: double.infinity,
                        // color: Colors.black,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                            Colors.black87,
                            Colors.black,
                          ])
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                              const Text("n", style: TextStyle(fontFamily: "eng", color: Colors.white, fontSize: 200, height: 0.5, fontWeight: FontWeight.bold),),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                              Text("Software Solutions for Everyday Needs", style: TextStyle( color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.07 * MediaQuery.of(context).textScaleFactor, fontWeight: FontWeight.bold, height: 1.2), textAlign: TextAlign.center,),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                              Text("Develops innovative and practical apps to simplify daily tasks and enhance user experience.", style: TextStyle( color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05 * MediaQuery.of(context).textScaleFactor), textAlign: TextAlign.center),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(
                                        MediaQuery.of(context).size.width * 0.35,
                                        MediaQuery.of(context).size.height * 0.06,
                                      )), // عرض 200 وطول 60
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    _scrollController.animateTo(
                                      _scrollController.offset + MediaQuery.of(context).size.height,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: const Text(
                                    "My Products",
                                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                TextButton(
                                style: ButtonStyle(
                                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(
                                        MediaQuery.of(context).size.width * 0.35,
                                        MediaQuery.of(context).size.height * 0.06,
                                      )),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: (){
                                    github();
                                  },
                                  child: const Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.github, color: Colors.black,),
                                      Text(
                                        "  Website ",
                                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                ],
                              ),
                        
                            ],),
                          ),
                        ),
                      ),
        
                      // Section 2 
                      Container(
                        // height: 900,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                          child: Column(
                            children: [
                              Text("MY Products", style: TextStyle( color: Colors.black, fontSize: MediaQuery.of(context).size.width * 0.08 , fontWeight: FontWeight.w900, fontFamily: "web" ,height: 1.2), textAlign: TextAlign.center,),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/page_two');
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.shortestSide * 0.3,
                                        height: MediaQuery.of(context).size.shortestSide * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                            image: AssetImage(appTwoLogo),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(appTwoName, style: TextStyle( color: Colors.black, fontSize: MediaQuery.of(context).size.width * 0.05 , fontWeight: FontWeight.w900), textAlign: TextAlign.center,)
                                    ],
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/page_one');
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.shortestSide * 0.3,
                                        height: MediaQuery.of(context).size.shortestSide * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                            image: AssetImage(appLogo),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(appName, style: TextStyle( color: Colors.black, fontSize: MediaQuery.of(context).size.width * 0.05 , fontWeight: FontWeight.w900), textAlign: TextAlign.center,)
                                
                                    ],
                                  ),
                                )
                              ],),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 150,),
                      // section 3
                      Container(
                        color: Colors.black12,
                        width: double.infinity,
                        height: 70,
                        child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black, size: 25),
                                    onPressed: () {
                                      facebook();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.black, size: 25),
                                    onPressed: () {
                                      linkedIn();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.black, size: 25),
                                    onPressed: () {
                                      youtube();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.solidEnvelope, color: Colors.black, size: 25),
                                    onPressed: () {
                                      email();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.globe, color: Colors.black, size: 25),
                                    onPressed: () {
                                      website();
                                    },
                                  ),
                                ],
                              ),
                      )
                    ],
            ),
        );
        }
        return Scaffold(
          backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(flex: 1,),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(child: Text("null", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.35 * MediaQuery.of(context).textScaleFactor, fontFamily: "eng", fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.05)),)),
                        const Center(
                          child: Text(
                            "Sorry, this website is not compatible with your screen size.",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "web", letterSpacing: 3, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1,),
                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white, size: 25),
                                    onPressed: () {
                                      facebook();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 25),
                                    onPressed: () {
                                      linkedIn();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white, size: 25),
                                    onPressed: () {
                                      youtube();
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.solidEnvelope, color: Colors.white, size: 25),
                                    onPressed: () {
                                      email();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,)
              ],
            ),
          );
        },
    );
  }
}