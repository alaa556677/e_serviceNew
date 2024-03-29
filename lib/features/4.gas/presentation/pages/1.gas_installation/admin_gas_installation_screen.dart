import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

import '../../../../../core/widgets/card_show_data_admin.dart';
import '../../../domain/entity/1.1gas_installation_entity.dart';

class AdminGasInstallationScreen extends StatelessWidget {
  final GasInstallationEntity gasInstallationEntity;
  const AdminGasInstallationScreen({super.key, required this.gasInstallationEntity});

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
                      text: 'تفاصيل التعاقد',
                      fontColor: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                CardShowDataWaterInstallation(
                  title: "اسم العميل",
                  customerName: gasInstallationEntity.customerName,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title: 'رقم الموبايل',
                  customerName: gasInstallationEntity.customerMobile,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'العنوان',
                  customerName: gasInstallationEntity.customerAddress,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'نوع العقار',
                  customerName: gasInstallationEntity.homeType,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'صورة إثبات الشخصية',
                  isImage: true,
                  imageUrl: gasInstallationEntity.idImageUrl,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'صورة عقد الملكية',
                  isImage: true,
                  imageUrl: gasInstallationEntity.contractImageUrl,
                ),
                SizedBox(height: 10.h,),
                CardShowDataWaterInstallation(
                  title:'صورة الايصال',
                  isImage: true,
                  imageUrl: gasInstallationEntity.receiptImageUrl,
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
