

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soilpedia/const/app_colors.dart';
import 'package:soilpedia/ui/views/buttom_nav_conttoler/pages/nav_calcularor.dart';
import 'package:soilpedia/ui/views/buttom_nav_conttoler/pages/nav_soil_dairy.dart';
import 'package:soilpedia/ui/views/buttom_nav_conttoler/pages/nav_video.dart';

import '../../../const/app_strings.dart';


class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 1.obs;
  RxBool _drawer = false.obs;

  final _pages = [
    NavCalculeror(),
    NavDairy(),
    NavVideo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          top: _drawer.value == false ? 0 : 100.h,
          bottom: _drawer.value == false ? 0 : 100.h,
          left: _drawer.value == false ? 0 : 200.w,
          right: _drawer.value == false ? 0 : -100.w,
          duration: Duration(microseconds: 400),
          child: Container(
            child: Scaffold(
              
              appBar: AppBar(
              
                backgroundColor: AppColors.crystalblueColor,
                elevation: 0,
                title: Text(
                  AppString.appName,
                  style: TextStyle(color: Colors.black),
                ),
                leading: _drawer == false
                    ? IconButton(
                        onPressed: () {
                          _drawer.value = true;
                        },
                        icon: Icon(Icons.menu, color: Colors.black),
                      )
                    : IconButton(
                        onPressed: () {
                          _drawer.value = false;
                        },
                        icon: Icon(Icons.close, color: Colors.black),
                      ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: AppColors.crystalblueColor,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.black,
                  currentIndex: _currentIndex.value,
                  onTap: (value) => _currentIndex.value = value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calculate_outlined), label: "calculator"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book_online_outlined), label: "Note"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.video_library_outlined), label: "Video"),
                  ]),
              body: _pages[_currentIndex.value],
            ),
          ),
        ));
  }
}
