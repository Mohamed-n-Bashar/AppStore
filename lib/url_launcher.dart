import 'package:url_launcher/url_launcher.dart';

websites(String x)async{
  try {
    final Uri uri = Uri.parse("${x}");
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> linkedIn() async {
  await openUrl('https://www.linkedin.com/company/null-t/');
}

Future<void> facebook() async {
  await openUrl('https://www.facebook.com/profile.php?id=61572611464188');
}

Future<void> youtube() async {
  await openUrl('https://youtube.com/@null-company?si=6xDCuffMk-CsK0Ml');
}

// Future<void> website() async {
//   await openUrl('https://null-tech.netlify.app/');  // https://null-social-links.netlify.app/
// }



whatsapp()async{
  try {
    final Uri uri = Uri.parse("https://wa.me/20${01556061588}");
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

email()async{
  try {
    final Uri uri = Uri.parse("mailto:${"null.devs01@gmail.com"}");
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

website()async{
  try {
    final Uri uri = Uri.parse("https://null-tech.netlify.app/");
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}

github()async{
  try {
    final Uri uri = Uri.parse("https://github.com/Mohamed-n-Bashar/AppStore/");
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }
  } catch (e) {
    print(e.toString());
  }
}