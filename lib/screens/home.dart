import 'package:ads/ads/banner.dart';
import 'package:ads/ads/intertial.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Intertial interstitialAd = Intertial();

  @override
  void initState() {
    super.initState();
    interstitialAd.loadInterstitialAd(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Ads'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text('Ads...'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              interstitialAd.showInterstitialAd();
            },
            child: const Text('Click'),
          ),
          const Spacer(),
          const Bannerads(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    interstitialAd.disposeInterstitialAd();
    super.dispose();
  }
}
