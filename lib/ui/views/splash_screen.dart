import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:soilpedia/ui/route/route.dart';

import '../../const/app_strings.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() => Get.toNamed(homeScreen));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  image: DecorationImage(image: AssetImage('assets/logo/1024.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Text(AppString.appName,style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
