import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/3.1electricity_meter_reading_entity.dart';

class AdminElectricityMeterReadingScreen extends StatelessWidget {
  final ElectricityMeterReadingEntity electricityMeterReadingEntity;
  const AdminElectricityMeterReadingScreen({super.key, required this.electricityMeterReadingEntity});

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
                      text: 'تفاصيل قراءة عداد الكهرباء',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: "اسم العميل",
                  customerName: electricityMeterReadingEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "العنوان",
                  customerName: electricityMeterReadingEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "رقم العداد",
                  customerName: electricityMeterReadingEntity.meterNumber,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "القراءة السابقة",
                  customerName: electricityMeterReadingEntity.previousReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "القراءة الحالية",
                  customerName: electricityMeterReadingEntity.nowReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "صورة ايصال سابق",
                  isImage: true,
                  imageUrl: electricityMeterReadingEntity.imageReceipt,
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
