import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'const/app_strings.dart';
import 'ui/route/route.dart';
import 'ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "Soilpedia",
    options: FirebaseOptions(
        apiKey: "AIzaSyCm05nNGNV2nXcbT2wEAnRZJ3OEwmF6ack",
        appId: "1:401496909411:android:72e0a23010d6214fef7a56",
        messagingSenderId: "401496909411",
        projectId: "soilpedia-89272"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }
          return CircularProgressIndicator();
        });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 802.9090909090909),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          //translations: AppLanguages(),
          //locale: Locale('en', 'US'),
          //fallbackLocale: Locale('en', 'US'),
          //theme: AppTheme().lightTheme(context),
          //darkTheme: AppTheme().darkTheme(context),
          //themeMode: ThemeMode.light,
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
