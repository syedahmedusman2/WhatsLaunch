import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsapplauncher/helper/ad_helper.dart';

class GoogleAd extends StatefulWidget {
  @override
  _GoogleAdState createState() => _GoogleAdState();
}

class _GoogleAdState extends State<GoogleAd> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  // late InterstitialAd _interstitialAd;

  // bool _isInterstitialAdReady = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
        // Change Banner Size According to Ur Need
        size:AdSize.fluid,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, LoadAdError error) {
          print("Failed to Load A Banner Ad${error.message}");
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: AdRequest())
      ..load();
    //Interstitial Ads
    // InterstitialAd.load(
    //     adUnitId: AdHelper.interstitialAdUnitId,
    //     request: AdRequest(),
    //     adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
    //       this._interstitialAd = ad;
    //       _isInterstitialAdReady = true;
    //     }, onAdFailedToLoad: (LoadAdError error) {
    //       print("failed to Load Interstitial Ad ${error.message}");
    //     }));
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
    // _interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  if (_isBannerAdReady)
                    Container(
                      height: _bannerAd.size.height.toDouble(),
                      width: _bannerAd.size.width.toDouble(),
                      child: AdWidget(ad: _bannerAd),
                    ),
                    // Container(
                    //   height: 50,
                    //   color: Colors.blue,
                    // )
                  
                  
                ],
              ),
             
            ],
          ),
       
    );
  }
}