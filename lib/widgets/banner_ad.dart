import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../util/ad_helper.dart';

/// This example demonstrates anchored adaptive banner ads.
class BannerAdWidget extends StatefulWidget {
  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;
  Orientation? _orientation;
  Size? _size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newOrientation = MediaQuery.of(context).orientation;
    final newSize = MediaQuery.of(context).size;

    if ((newOrientation != _orientation) || (newSize != _size)) {
      _loadAd();
    }

    _orientation = newOrientation;
    _size = newSize;
  }

  _loadAd() async {
    _isLoaded = false;
    _anchoredAdaptiveAd?.dispose();
    _anchoredAdaptiveAd = null;

    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      return;
    }

    final bannerAdUnitId = AdHelper.bannerAdUnitId;

    if (bannerAdUnitId == null) {
      return;
    } else {
      _anchoredAdaptiveAd = BannerAd(
        adUnitId: bannerAdUnitId,
        size: size,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            setState(() {
              // When the ad is loaded, get the ad size and use it to set
              // the height of the ad container.
              _anchoredAdaptiveAd = ad as BannerAd;
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            setState(() {
              _anchoredAdaptiveAd = null;
              _isLoaded = false;
            });
            ad.dispose();
          },
        ),
      );

      _anchoredAdaptiveAd?.load();
    }
  }

  @override
  Widget build(BuildContext context) =>
      (_anchoredAdaptiveAd != null && _isLoaded)
          ? Container(
              width: _anchoredAdaptiveAd!.size.width.toDouble(),
              height: _anchoredAdaptiveAd!.size.height.toDouble(),
              child: AdWidget(ad: _anchoredAdaptiveAd!))
          : SizedBox.shrink();

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}
