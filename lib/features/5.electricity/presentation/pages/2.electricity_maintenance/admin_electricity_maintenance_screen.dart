import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/2.1electricity_maintenance_entity.dart';

class AdminElectricityMaintenanceScreen extends StatelessWidget {
  final ElectricityMaintenanceEntity electricityMaintenanceEntity;
  const AdminElectricityMaintenanceScreen({super.key, required this.electricityMaintenanceEntity});

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
                CardShowDataWaterInstallation(
                  title: "اسم العميل",
                  customerName: electricityMaintenanceEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'رقم الموبايل',
                  customerName: electricityMaintenanceEntity.customerMobile,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'العنوان',
                  customerName: electricityMaintenanceEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'نوع العقار',
                  customerName: electricityMaintenanceEntity.homeType,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'وصف الحالة',
                  customerName: electricityMaintenanceEntity.details,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'صورة إيصال غاز',
                  isImage: true,
                  imageUrl: electricityMaintenanceEntity.receiptImageUrl,
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
