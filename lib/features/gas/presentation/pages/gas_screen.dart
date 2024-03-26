import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';
import '../cubit/gas_cubit.dart';
import '../cubit/gas_states.dart';
import 'gas_installation_screen.dart';
import 'gas_maintenance_screen.dart';
import 'gas_meter reading_screen.dart';
import 'gas_remove_meter_screen.dart';

class GasScreen extends StatelessWidget{
  const GasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GasCubit(),
      child: BlocConsumer<GasCubit, GasStates>(
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
                            title: 'تعاقد عداد الغاز',
                            subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  GasInstallationScreen()));
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
                            title: 'تعديل وصيانة عداد الغاز',
                            subTitle: 'يمكنك تقديم طلب للتعديل او لصيانة العداد من خلال البرنامج وسيتم التواصل معك للمتابعة',
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  GasMaintenanceScreen()));
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
                            title: 'قراءة عداد الغاز',
                            subTitle: 'يمكنك تصوير العداد لرفع القراءة بدون الحاجة لحضور المحصل',
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  GasMeterReadingScreen()));
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
                            title: 'رفع عداد الغاز',
                            subTitle: 'يمكنك تقديم طلب لرفع العداد بدود الحضور الى مقر الشركة',
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  GasRemoveMeterScreen()));
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