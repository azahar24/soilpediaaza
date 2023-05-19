import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:soilpedia/const/app_colors.dart';
import 'package:soilpedia/ui/views/soil_details_page.dart_page.dart';

class NavDairy extends StatefulWidget {
  @override
  State<NavDairy> createState() => _NavDairyState();
}

class _NavDairyState extends State<NavDairy> {
  final BannerAd bannerAds = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4921062624283956/4575296293',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
      request: AdManagerAdRequest());
  interstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-4921062624283956/9640792857',
        request: AdManagerAdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            ad.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }
  //ads


  dynamic dataads;


  



  @override
  void initState() {
    bannerAds.load();
    interstitialAd();
    super.initState();

  }

  String name = "";

  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance.collection('soil').snapshots();

  

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(229, 229, 229, 1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.scaffoldColor,
            title: Card(
              color: Color.fromARGB(255, 221, 217, 217),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data!.docs[index].data()
                            as Map<String, dynamic>;

                        if (name.isEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(SoilDetailsPage(
                                documentId: snapshots.data!.docs[index].id,
                                data: data,
                              ));
                              interstitialAd();
                             
                             
                              


                            },
                            child: Card(
                              color: Color.fromARGB(255, 241, 236, 236),
                              child: ListTile(
                                title: Text(
                                  data['title'],
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  data['subtitle'],
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          );
                        }
                        if (data['title']
                            .toString()
                            .toLowerCase()
                            .startsWith(name.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(SoilDetailsPage(
                                documentId: snapshots.data!.docs[index].id,
                                data: data,
                              ));
                              interstitialAd();
                              


                            },
                            child: Card(
                              color: Color.fromARGB(255, 241, 236, 236),
                              child: ListTile(
                                title: Text(
                                  data['title'],
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  data['subtitle'],
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      });
            },
          )),
    );
  }
}
