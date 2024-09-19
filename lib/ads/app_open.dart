// app_open_ad.dart

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdManager {
  static AppOpenAd? _appOpenAd;

  static void loadAds() {
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/9257395921',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) {
          debugPrint("Error: $error");
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }
}
