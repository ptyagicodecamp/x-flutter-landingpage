import 'dart:html' as html;

//This approach is for web platform.
//import 'dart:io' show Platform; should be used for Native.
abstract class MyPlatform {
  static bool iOS() => false;
  static bool isAndroid() => false;
  static bool isMobile() => isAndroid() || iOS();

}

class WebPlatform extends MyPlatform {

  @override
  static bool iOS() {
    var _iOS = ['iPad Simulator', 'iPhone Simulator', 'iPod Simulator', 'iPad', 'iPhone', 'iPod'];
    var matches = false;
    _iOS.forEach((name) {
      if (html.window.navigator.platform.contains(name) || html.window.navigator.userAgent.contains(name)) {
        matches = true;
      }
    });
    return matches;
  }

  @override
  static bool isAndroid() =>
      html.window.navigator.platform == "Android" || html.window.navigator.userAgent.contains("Android");

  @override
  static bool isMobile() => isAndroid() || iOS();

  String name() {
    var name = "";
    if (isAndroid()) {
      name = "Android";
    } else if (iOS()) {
      name = "iOS";
    }
    return name;
  }

  void openStore() {
    if (isAndroid()) {
      html.window.location.href = "your Play Store URL";
    } else {
      html.window.location.href = "Your App Store URL";
    }
  }
}