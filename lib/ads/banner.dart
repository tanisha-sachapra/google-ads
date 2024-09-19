import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Bannerads extends StatefulWidget {
  const Bannerads({super.key});

  @override
  State<Bannerads> createState() => _BanneradsState();
}

class _BanneradsState extends State<Bannerads> {
  bool isBannerLoaded = false;
  late BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    initializeBannerAd();
  }

  initializeBannerAd() async {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/9214589741',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isBannerLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          setState(() {
            isBannerLoaded = false;
          });
          print('Banner Ad failed to load: $error');
        },
      ),
      request: AdRequest(),
    );

    bannerAd.load();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isBannerLoaded
        ? SizedBox(
            height: bannerAd.size.height.toDouble(),
            width: bannerAd.size.width.toDouble(),
            child: AdWidget(ad: bannerAd),
          )
        : const SizedBox();
  }
}
