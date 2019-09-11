import 'package:webfeed/domain/atom_feed.dart';
import 'package:http/http.dart' as http;

class RssService {
  final _targetUrl = 'https://ptyagicodecamp.github.io/feeds/flutter.atom.xml';

  Future<AtomFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => AtomFeed.parse(xmlString));

//tag:ptyagicodecamp.github.io,2019-08-30:/custom-switch-widget-for-accepting-privacy-policy-in-flutter-apps.html
}
