import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/home/presentation/pages/pay_bill_screen.dart';
import 'package:e_services/features/water/presentation/cubit/water_cubit.dart';
import 'package:e_services/features/water/presentation/cubit/water_states.dart';
import 'package:e_services/features/water/presentation/pages/water_installation_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_maintenance_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_meter_reading_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_remove_meter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';
import '../../../../core/widgets/home_component.dart';
import '../../../gas/presentation/pages/gas_installation_screen.dart';

class WaterScreen extends StatelessWidget{
  const WaterScreen({super.key});
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterCubit(),
      child: BlocConsumer<WaterCubit, WaterStates>(
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
                        title: 'تعاقد عداد مياه',
                        subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterInstallationScreen()));
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
                        title: 'تعديل وصيانة عداد المياه',
                        subTitle: 'يمكنك تقديم طلب للتعديل او لصيانة العداد من خلال البرنامج وسيتم التواصل معك للمتابعة',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterMaintenanceScreen()));
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
                        title: 'قراءة عداد المياه',
                        subTitle: 'يمكنك تصوير العداد لرفع القراءة بدون الحاجة لحضور المحصل',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterMeterReadingScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/water_meter.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'رفع عداد المياه',
                        subTitle: 'يمكنك تقديم طلب لرفع العداد بدود الحضور الى مقر الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterRemoveMeterScreen()));
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