import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soilpedia/const/app_strings.dart';
import 'package:soilpedia/ui/route/route.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../widgets/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 50.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.appName,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            ToggleSwitch(
              minWidth: 70.0.w,
              minHeight: 40.0.h,
              initialLabelIndex: 0,
              cornerRadius: 20.0.r,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              icons: [
                Icons.dark_mode,
                Icons.light_mode,
              ],
              iconSize: 25.0.sp,
              activeBgColors: [
                [Colors.black45, Colors.black26],
                [Colors.yellow, Colors.orange]
              ],
              animate:
                  true, // with just animate set to true, default curve = Curves.easeIn
              curve: Curves
                  .bounceInOut, // animate must be set to true when using custom curve
              onToggle: (index) {
                print('switched to: $index');
                if(index==0){
                  return Get.changeTheme(ThemeData.dark());
                  
                  
                }else if(index==1){
                 return Get.changeTheme(ThemeData.light());
                }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            drawerItem(
              "Support",
              () => Get.toNamed(''),
            ),
            drawerItem(
              "Privacy",
              () => Get.toNamed(''),
            ),
            drawerItem(
              "FAQ",
              () => Get.toNamed(faqScreen),
            ),
            drawerItem(
              "Rate US",
              () {},
            ),
            drawerItem(
              "How to use",
              () => Get.toNamed(''),
            ),
          ],
        ),
      ),
    );
  }
}
