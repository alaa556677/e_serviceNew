import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/button_custom_widget.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class AdminWaterMaintenanceScreen extends StatelessWidget {
  const AdminWaterMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'تفاصيل الصيانه والتعديلات',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Text('اسم العميل',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("علاء محمد بكر",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('رقم الموبايل',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("002010000001",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('العنوان',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("قويسنا منوفية",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('نوع الخدمة',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("صيانة عداد",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('نوع العقار',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("وحدة سكنية",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('وصف الحالة',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(child: Text("عداد المياه لا يعمل بشكل جيد ويحتاج الي صيانة فورية",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),)),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('صورة إيصال مياه',style: TextStyle(color:Colors.grey,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Center(

                  child: InstaImageViewer(
                      child: Image.asset('assets/images/waterbill.jpg', height: 80.h, width: 80.w,)),
                ),                SizedBox(height: 10.h,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: textGreyColor),
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50.0,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Text("مرفوض",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(width: 50.0,),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: (){},
                          height: 50.0,
                          color: blueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Text("مقبول",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
