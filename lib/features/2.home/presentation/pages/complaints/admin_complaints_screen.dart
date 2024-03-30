import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/complaints_entity.dart';


class AdminComplaintsShowScreen extends StatelessWidget {
  final ComplaintsEntity complaintsEntity;
  const AdminComplaintsShowScreen({super.key, required this.complaintsEntity});
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
                      text: 'تفاصيل الشكوي',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: 'اسم العميل',
                  customerName: complaintsEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'رقم الموبايل',
                  customerName: complaintsEntity.customerMobile,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'الشكوي',
                  customerName: complaintsEntity.reason,
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
