import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsapplauncher/helper/ad_helper.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  BannerAd? bannerAd;
  bool _isBannerAdReady = false;
  @override
  void initState() {
    super.initState();
    bannerAd = BannerAd(
        size: AdSize.mediumRectangle,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, LoadAdError error) {
          print("Failed to Load A Banner Ad${error.message}");
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: const AdRequest(),
        adUnitId: AdHelper.bannerAdUnitId)..load();
  }
  @override
  void dispose() {
    super.dispose();
    bannerAd!.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _isBannerAdReady
           ? Container(
                    height: bannerAd!.size.height.toDouble(),
                    width: bannerAd!.size.width.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                  ) 
           : Container(
             color: Colors.red,
             height: 50,
             width: 50,
           ),
        ],
      ),
    );
  }
}
