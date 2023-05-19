import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soilpedia/const/app_colors.dart';

class SoilDetailsPage extends StatefulWidget {
  var documentId;
  var data;

  SoilDetailsPage({
    required this.documentId,
    required this.data,
  });

  @override
  State<SoilDetailsPage> createState() => _SoilDetailsPageState();
}

class _SoilDetailsPageState extends State<SoilDetailsPage> {
  late int fontSize = 21;
 late List<bool>  isSelected;

   getFontSize(int index) {
    if (index == 0) {
      return 18;
    }else if(index==1){
      return 21;
    }else if(index==2){
      return 25;
    }
  }


  @override
  void initState() {
    isSelected= [
      false,
      true,
      false,

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Pedia'),
        backgroundColor: AppColors.crystalblueColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                child: Text(
                  widget.data['title'],
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //title
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: ToggleButtons(
                  children: [
                  Text(
                    'A',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                      fontSize: 21.sp,
                    ),
                  ),
                  Text(
                    'A',
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                  ),
      
                ],
                 isSelected: isSelected,
                 onPressed: ((index) {
                   for(var i = 0; i<isSelected.length; i++){
                    if(i==index){
                      isSelected[i] = true;
                    }else{
                      isSelected[i] = false;
                    }
                   }
                   fontSize = getFontSize(index);
                   setState(() {
                     
                   });
                 }),
                 ),
              ),
              //text size
              Container(
                  padding: EdgeInsets.all(15.r),
                  
                  width: double.infinity.w,
                  child: Center(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 151, 34),
                            fontSize: fontSize.toDouble().sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500
                            ),
                          text: 'English: ',
                          children: [
                            TextSpan(
                              text: widget.data['subtitle'],
                              style: TextStyle(
                                 color: Colors.black,
                                fontSize: fontSize.toDouble(),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                              )
                            )


                          ]
                        ),
                       
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
                    ),
                    color: Color(0xFFE5E5E5),
                    border: Border.all(
                      color: Color(0xFF36C3FF),
                      width: 2.w,
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                //eng subtitle
                Container(
                  padding: EdgeInsets.all(15.r),
                  
                  width: double.infinity.w,
                  child: Center(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 151, 34),
                            fontSize: fontSize.toDouble(),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500
                            ),
                          text: 'Bangla: ',
                          children: [
                            TextSpan(
                              text: widget.data['bnsubtitle'],
                              style: TextStyle(
                                 color: Colors.black,
                                fontSize: fontSize.toDouble(),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                              )
                            )


                          ]
                        ),
                       
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
                    ),
                    color: Color(0xFFE5E5E5),
                    border: Border.all(
                      color: Color(0xFF36C3FF),
                      width: 2.w,
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                //bangla subtitle

              Container(
                  padding: EdgeInsets.all(15.r),
                  
                  width: double.infinity.w,
                  child: Center(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color.fromARGB(255, 240, 151, 34),
                            fontSize: fontSize.toDouble(),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500
                            ),
                          text: 'Refarance: ',
                          children: [
                            TextSpan(
                              text: widget.data['reference'],
                              style: TextStyle(
                                 color: Colors.black,
                                fontSize: fontSize.toDouble(),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                              )
                            )


                          ]
                        ),
                       
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
                    ),
                    color: Color(0xFFE5E5E5),
                    border: Border.all(
                      color: Color(0xFF36C3FF),
                      width: 2.w,
                    ),
                  ),
                ),  
      
            ],
          ),
        ),
      ),
    );
  }
}
