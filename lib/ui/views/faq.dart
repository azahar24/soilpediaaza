
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FAQ '),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      'Developer',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        image: DecorationImage(
                            image: AssetImage('assets/logo/azahar.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Text(
                        'Azahar Uddin',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Work as Android Apps Developer',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          //launch('https://www.facebook.com/azahar26');
                        },
                        icon: Icon(Icons.facebook_outlined),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      IconButton(
                        onPressed: () {
                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

// ···
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'azaharuddin454@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject':
                                  '',
                            }),
                          );
                          launchUrl(emailLaunchUri);
                        },
                        icon: Icon(Icons.mail),
                      ),
                    ],
                  )
                ],
              ),
              //Azahar uddin

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      'Database Developer',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        image: DecorationImage(
                            image: AssetImage('assets/logo/siyam.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Text(
                        'Siyam Rahman',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Students of Soil Science - Govt B. C.',
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          //launch('https://www.facebook.com/siyam.siyam.180625');
                        },
                        icon: Icon(Icons.facebook_outlined),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      IconButton(
                        onPressed: () {
                          String? encodeQueryParameters(
                              Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }

// ···
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'siyamsiyam619@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject':
                                  '',
                            }),
                          );
                          launchUrl(emailLaunchUri);
                        },
                        icon: Icon(Icons.mail),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
