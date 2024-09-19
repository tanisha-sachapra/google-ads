import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Intertial {
  late InterstitialAd interstitialAd;
  bool isInterstitialAdLoaded = false;

  void loadInterstitialAd(VoidCallback onAdLoaded) {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',

      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          isInterstitialAdLoaded = true;
          onAdLoaded();
        },
        onAdFailedToLoad: (error) {
          print("Interstitial Ad failed to load: $error");
          isInterstitialAdLoaded = false;
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (isInterstitialAdLoaded) {
      interstitialAd.show();
      loadInterstitialAd(() {});
    } else {
      print('Interstitial ad is not loaded yet.');
    }
  }

  void disposeInterstitialAd() {
    interstitialAd.dispose();
  }
}
