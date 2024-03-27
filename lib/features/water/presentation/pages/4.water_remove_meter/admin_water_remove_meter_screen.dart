import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/4.1water_remove_meter_entity.dart';

class AdminWaterRemoveMeterScreen extends StatelessWidget {
  final WaterRemoveMeterEntity waterRemoveMeterEntity;
  const AdminWaterRemoveMeterScreen({super.key, required this.waterRemoveMeterEntity});
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
                      text: 'تفاصيل رفع عداد المياه',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: 'اسم العميل',
                  customerName: waterRemoveMeterEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'العنوان',
                  customerName: waterRemoveMeterEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'رقم الموبايل',
                  customerName: waterRemoveMeterEntity.customerMobile,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'رقم العداد',
                  customerName: waterRemoveMeterEntity.meterNumber,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'أحدث قرائة للعداد',
                  customerName: waterRemoveMeterEntity.nowReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'سبب طلب رفع العداد',
                  customerName: waterRemoveMeterEntity.reason,
                ),
                SizedBox(height: 20.0,),
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
