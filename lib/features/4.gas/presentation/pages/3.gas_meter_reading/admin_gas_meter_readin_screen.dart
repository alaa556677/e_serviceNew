import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/3.1gas_meter_reading_entity.dart';

class AdminGasMeterReadingScreen extends StatelessWidget {
  final GasMeterReadingEntity gasMeterReadingEntity;
  const AdminGasMeterReadingScreen({super.key, required this.gasMeterReadingEntity});
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
                      text: 'تفاصيل قراءة عداد المياه',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: "اسم العميل",
                  customerName: gasMeterReadingEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "العنوان",
                  customerName: gasMeterReadingEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "رقم العداد",
                  customerName: gasMeterReadingEntity.meterNumber,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "القراءة السابقة",
                  customerName: gasMeterReadingEntity.previousReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "القراءة الحالية",
                  customerName: gasMeterReadingEntity.nowReading,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: "صورة ايصال سابق",
                  isImage: true,
                  imageUrl: gasMeterReadingEntity.imageReceipt,
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
