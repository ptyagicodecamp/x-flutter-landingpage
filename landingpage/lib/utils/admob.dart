import 'package:firebase_admob/firebase_admob.dart';

class Admob {
  static MobileAdTargetingInfo targetingInfo() {
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      birthday: DateTime.now(),
      childDirected: false,
      designedForFamilies: false,
      gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>[], // Android emulators are considered test devices
    );

    return targetingInfo;
  }

  static BannerAd createBannerAd() {
    BannerAd myBanner = BannerAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo(),
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );

    return myBanner;
  }

  static InterstitialAd createInterstitialAd() {
    InterstitialAd myInterstitial = InterstitialAd(
      // Replace the testAdUnitId with an ad unit id from the AdMob dash.
      // https://developers.google.com/admob/android/test-ads
      // https://developers.google.com/admob/ios/test-ads
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo(),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );

    return myInterstitial;
  }

  static void showBannerAd() {
    var myBanner = createBannerAd();
    myBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: 60.0,
        // Banner Position
        anchorType: AnchorType.bottom,
      );
  }

  static void showInterstitialAd() {
    var myInterstitial = createInterstitialAd();
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
      );
  }
}