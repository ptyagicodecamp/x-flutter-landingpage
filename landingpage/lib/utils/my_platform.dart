//import 'dart:html' as html;
import 'dart:io' show Platform;

//This approach is for web platform.
//import 'dart:io' as Platform; should be used for Native.
abstract class MyPlatform {
  static bool iOS() => false;
  static bool isAndroid() => false;
  static bool isMobile() => isAndroid() || iOS();

}

class NativePlatform implements MyPlatform {

  @override
  static bool iOS() => Platform.isIOS;

  @override
  static bool isAndroid() => Platform.isAndroid;

  @override
  static bool isMobile() => isAndroid() || iOS();
}