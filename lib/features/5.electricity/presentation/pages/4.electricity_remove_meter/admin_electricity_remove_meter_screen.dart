import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/4.1electricity_remove_meter_entity.dart';

class AdminElectricityRemoveMeterScreen extends StatelessWidget {
  final ElectricityRemoveMeterEntity electricityRemoveMeterEntity;
  const AdminElectricityRemoveMeterScreen({super.key, required this.electricityRemoveMeterEntity});

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
                      text: 'تفاصيل رفع عداد الكهرباء',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: 'اسم العميل',
                  customerName: electricityRemoveMeterEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'العنوان',
                  customerName: electricityRemoveMeterEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'رقم الموبايل',
                  customerName: electricityRemoveMeterEntity.customerMobile,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'رقم العداد',
                  customerName: electricityRemoveMeterEntity.meterNumber,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'أحدث قرائة للعداد',
                  customerName: electricityRemoveMeterEntity.nowReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'سبب طلب رفع العداد',
                  customerName: electricityRemoveMeterEntity.reason,
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
