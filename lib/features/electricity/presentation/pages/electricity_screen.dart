import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';
import '../cubit/electricity_cubit.dart';
import '../cubit/electricity_states.dart';
import 'electricity_installation_screen.dart';
import 'electricity_maintenance_screen.dart';
import 'electricity_meter_reading_screen.dart';
import 'electricity_remove_meter_screen.dart';

class ElectricityScreen extends StatefulWidget{
  const ElectricityScreen({super.key});
  @override
  State<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends State<ElectricityScreen> {
  late ElectricityCubit electricityCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultScreen(
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardBasicItem(
                        title: 'تعاقد عداد الكهرباء',
                        subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ElectricityInstallationScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/installation.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'تعديل وصيانة عداد الكهرباء',
                        subTitle: 'يمكنك تقديم طلب للتعديل او لصيانة العداد من خلال البرنامج وسيتم التواصل معك للمتابعة',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ElectricityMaintenanceScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/maintenance.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'قراءة عداد الكهرباء',
                        subTitle: 'يمكنك تصوير العداد لرفع القراءة بدون الحاجة لحضور المحصل',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ElectricityMeterReadingScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/gas_meter.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'رفع عداد الكهرباء',
                        subTitle: 'يمكنك تقديم طلب لرفع العداد بدود الحضور الى مقر الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ElectricityRemoveMeterScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/request_remove.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}