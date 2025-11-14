import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launch (String url) async{
    try {
      final uri = Uri.parse(url);

      LaunchMode mode;

      if (uri.scheme == 'tel' || uri.scheme == 'mailto' ||
          uri.scheme == 'sms') {
        mode = LaunchMode.externalNonBrowserApplication;
      } else {
        mode = LaunchMode.externalApplication;
      }

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: mode);
      }
      else {
        await launchUrl(uri, mode: mode);
      }
    }
    catch(e){
      print('Could not launch $url:$e');
    }
  }
}