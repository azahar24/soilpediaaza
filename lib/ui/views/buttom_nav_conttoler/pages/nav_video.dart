import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Caming Soon',style: TextStyle(
          fontSize: 60.sp,
          fontWeight: FontWeight.bold

        ),),
      ),
    );
  }
}