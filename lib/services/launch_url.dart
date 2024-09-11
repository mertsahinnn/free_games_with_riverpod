import 'package:url_launcher/url_launcher.dart';

Future<void> launchGameUrl(String url) async {
      var url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception("coudl not launch");
      }
    }