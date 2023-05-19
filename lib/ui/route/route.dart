import 'package:get/get.dart';
import 'package:soilpedia/ui/views/faq.dart';

import '../views/main_home_page.dart';
import '../views/splash_screen.dart';

const String splash = '/splash-screen';
const String homeScreen = '/home-screen';
const String loginScreen = '/login-screen';
const String faqScreen = '/faq-screen';


List<GetPage> getPages = [
  GetPage(
      name: splash,
      page: () => SplashScreen()
  ),
  GetPage(
      name: homeScreen,
      page: () => MainHomeScreen()
  ),
  GetPage(
      name: faqScreen,
      page: () => FaqScreen()
  ),
  

];